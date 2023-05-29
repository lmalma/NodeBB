'use strict';

const nconf = require('nconf');
const _ = require('lodash');

const db = require('../../database');
const user = require('../../user');
const posts = require('../../posts');
const categories = require('../../categories');
const plugins = require('../../plugins');
const privileges = require('../../privileges');
const accountHelpers = require('./helpers');
const { getActor } = require('../../activitypub');
const helpers = require('../helpers');
const slugify = require('../../slugify');
const utils = require('../../utils');

const profileController = module.exports;

profileController.get = async function (req, res, next) {
	if (res.locals.uid === -2) {
		return profileController.getFederated(req, res, next);
	}

	const lowercaseSlug = req.params.userslug.toLowerCase();

	if (req.params.userslug !== lowercaseSlug) {
		if (res.locals.isAPI) {
			req.params.userslug = lowercaseSlug;
		} else {
			return res.redirect(`${nconf.get('relative_path')}/user/${lowercaseSlug}`);
		}
	}

	const userData = await accountHelpers.getUserDataByUserSlug(req.params.userslug, req.uid, req.query);
	if (!userData) {
		return next();
	}

	await incrementProfileViews(req, userData);

	const [latestPosts, bestPosts] = await Promise.all([
		getLatestPosts(req.uid, userData),
		getBestPosts(req.uid, userData),
		posts.parseSignature(userData, req.uid),
	]);

	userData.posts = latestPosts; // for backwards compat.
	userData.latestPosts = latestPosts;
	userData.bestPosts = bestPosts;
	userData.breadcrumbs = helpers.buildBreadcrumbs([{ text: userData.username }]);
	userData.title = userData.username;

	// Show email changed modal on first access after said change
	userData.emailChanged = req.session.emailChanged;
	delete req.session.emailChanged;

	if (!userData.profileviews) {
		userData.profileviews = 1;
	}

	addMetaTags(res, userData);

	res.render('account/profile', userData);
};

profileController.getFederated = async function (req, res, next) {
	const { userslug: uid } = req.params;
	const actor = await getActor(uid);
	if (!actor) {
		return next();
	}
	// console.log(actor);
	const { preferredUsername, published, icon, image, name, summary, hostname } = actor;

	const payload = {
		uid,
		username: `${preferredUsername}@${hostname}`,
		userslug: slugify(`${preferredUsername}@${hostname}`),
		fullname: name,
		joindate: new Date(published).getTime(),
		picture: typeof icon === 'string' ? icon : icon.url,
		uploadedpicture: typeof icon === 'string' ? icon : icon.url,
		'cover:url': typeof image === 'string' ? image : image.url,
		'cover:position': '50% 50%',
		aboutme: summary,
		aboutmeParsed: summary,
	};

	res.render('account/profile', payload);
};

async function incrementProfileViews(req, userData) {
	if (req.uid >= 1) {
		req.session.uids_viewed = req.session.uids_viewed || {};

		if (
			req.uid !== userData.uid &&
			(!req.session.uids_viewed[userData.uid] || req.session.uids_viewed[userData.uid] < Date.now() - 3600000)
		) {
			await user.incrementUserFieldBy(userData.uid, 'profileviews', 1);
			req.session.uids_viewed[userData.uid] = Date.now();
		}
	}
}

async function getLatestPosts(callerUid, userData) {
	return await getPosts(callerUid, userData, 'pids');
}

async function getBestPosts(callerUid, userData) {
	return await getPosts(callerUid, userData, 'pids:votes');
}

async function getPosts(callerUid, userData, setSuffix) {
	const cids = await categories.getCidsByPrivilege('categories:cid', callerUid, 'topics:read');
	const keys = cids.map(c => `cid:${c}:uid:${userData.uid}:${setSuffix}`);
	let hasMorePosts = true;
	let start = 0;
	const count = 10;
	const postData = [];

	const [isAdmin, isModOfCids, canSchedule] = await Promise.all([
		user.isAdministrator(callerUid),
		user.isModerator(callerUid, cids),
		privileges.categories.isUserAllowedTo('topics:schedule', cids, callerUid),
	]);
	const isModOfCid = _.zipObject(cids, isModOfCids);
	const cidToCanSchedule = _.zipObject(cids, canSchedule);

	do {
		/* eslint-disable no-await-in-loop */
		let pids = await db.getSortedSetRevRange(keys, start, start + count - 1);
		if (!pids.length || pids.length < count) {
			hasMorePosts = false;
		}
		if (pids.length) {
			({ pids } = await plugins.hooks.fire('filter:account.profile.getPids', {
				uid: callerUid,
				userData,
				setSuffix,
				pids,
			}));
			const p = await posts.getPostSummaryByPids(pids, callerUid, { stripTags: false });
			postData.push(...p.filter(
				p => p && p.topic && (
					isAdmin ||
					isModOfCid[p.topic.cid] ||
					(p.topic.scheduled && cidToCanSchedule[p.topic.cid]) ||
					(!p.deleted && !p.topic.deleted)
				)
			));
		}
		start += count;
	} while (postData.length < count && hasMorePosts);
	return postData.slice(0, count);
}

function addMetaTags(res, userData) {
	const plainAboutMe = userData.aboutme ? utils.stripHTMLTags(utils.decodeHTMLEntities(userData.aboutme)) : '';
	res.locals.metaTags = [
		{
			name: 'title',
			content: userData.fullname || userData.username,
			noEscape: true,
		},
		{
			name: 'description',
			content: plainAboutMe,
		},
		{
			property: 'og:title',
			content: userData.fullname || userData.username,
			noEscape: true,
		},
		{
			property: 'og:description',
			content: plainAboutMe,
		},
	];

	if (userData.picture) {
		res.locals.metaTags.push(
			{
				property: 'og:image',
				content: userData.picture,
				noEscape: true,
			},
			{
				property: 'og:image:url',
				content: userData.picture,
				noEscape: true,
			}
		);
	}
}
