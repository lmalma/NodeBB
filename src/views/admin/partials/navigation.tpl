<!-- main acp navigation menu -->

<div class="accordion overflow-auto d-flex flex-column gap-1" id="accordionACP">
	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDashboard" aria-expanded="true" aria-controls="collapseDashboard">
			<i class="fa fa-gauge text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-dashboard]]</div>
		</button>

		<div id="collapseDashboard" class="accordion-collapse collapse show" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/dashboard">[[admin/menu:dashboard/overview]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/dashboard/logins">[[admin/menu:dashboard/logins]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/dashboard/users">[[admin/menu:dashboard/users]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/dashboard/topics">[[admin/menu:dashboard/topics]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/dashboard/searches">[[admin/menu:dashboard/searches]]</a>
			</div>
		</div>
	</div>

	{{{ if showManageMenu }}}
	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseManage" aria-expanded="true" aria-controls="collapseManage">
			<i class="fa fa-list text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-manage]]</div>
		</button>

		<div id="collapseManage" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				{{{ if user.privileges.admin:categories }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="manage-categories" href="{relative_path}/admin/manage/categories">[[admin/menu:manage/categories]]</a>
				{{{ end }}}
				{{{ if user.privileges.admin:privileges }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/privileges">[[admin/menu:manage/privileges]]</a>
				{{{ end }}}
				{{{ if user.privileges.admin:users }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="manage-users" href="{relative_path}/admin/manage/users">[[admin/menu:manage/users]]</a>
				{{{ end }}}
				{{{ if user.privileges.admin:groups }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/groups">[[admin/menu:manage/groups]]</a>
				{{{ end }}}
				{{{ if user.privileges.admin:admins-mods }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/admins-mods">[[admin/menu:manage/admins-mods]]</a>
				{{{ end }}}
				{{{ if user.privileges.admin:tags }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/tags">[[admin/menu:manage/tags]]</a>
				{{{ end }}}
				{{{ if user.privileges.superadmin }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/registration">[[admin/menu:manage/registration]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/uploads">[[admin/menu:manage/uploads]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/manage/digest">[[admin/menu:manage/digest]]</a>
				<hr/>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" target="_top" href="{relative_path}/post-queue">[[admin/menu:manage/post-queue]] <i class="fa fa-external-link"></i></a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" target="_top" href="{relative_path}/ip-blacklist">[[admin/menu:manage/ip-blacklist]] <i class="fa fa-external-link"></i></a>
				{{{ end }}}
			</div>
		</div>
	</div>
	{{{ end }}}

	{{{ if user.privileges.admin:settings }}}
	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSettings" aria-expanded="true" aria-controls="collapseSettings">
			<i class="fa fa-sliders text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-settings]]</div>
		</button>

		<div id="collapseSettings" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="settings-general" href="{relative_path}/admin/settings/general">[[admin/menu:section-general]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/navigation">[[admin/menu:settings/navigation]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/user">[[admin/menu:settings/user]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/reputation">[[admin/menu:settings/reputation]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/group">[[admin/menu:settings/group]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/tags">[[admin/menu:manage/tags]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/post">[[admin/menu:settings/post]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/uploads">[[admin/menu:settings/uploads]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/email">[[admin/menu:settings/email]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/chat">[[admin/menu:settings/chat]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/pagination">[[admin/menu:settings/pagination]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/notifications">[[admin/menu:settings/notifications]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/api">[[admin/menu:settings/api]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/social">[[admin/menu:settings/social]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/cookies">[[admin/menu:settings/cookies]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/web-crawler">[[admin/menu:settings/web-crawler]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/settings/advanced">[[admin/menu:settings/advanced]]</a>
			</div>
		</div>
	</div>

	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAppearance" aria-expanded="true" aria-controls="collapseAppearance">
			<i class="fa fa-paintbrush text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-appearance]]</div>
		</button>

		<div id="collapseAppearance" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="appearance-themes" href="{relative_path}/admin/appearance/themes">[[admin/menu:appearance/themes]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="appearance-skins" href="{relative_path}/admin/appearance/skins">[[admin/menu:appearance/skins]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" id="appearance-customise" href="{relative_path}/admin/appearance/customise">[[admin/menu:appearance/customise]]</a>
			</div>
		</div>
	</div>

	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExtend" aria-expanded="true" aria-controls="collapseExtend">
			<i class="fa fa-wrench text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-extend]]</div>
		</button>

		<div id="collapseExtend" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/extend/plugins">[[admin/menu:extend/plugins]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/extend/widgets">[[admin/menu:extend/widgets]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/extend/rewards">[[admin/menu:extend/rewards]]</a>
			</div>
		</div>
	</div>

	{{{ if plugins.length }}}
	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePlugins" aria-expanded="true" aria-controls="collapsePlugins">
			<i class="fa fa-plug text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-plugins]]</div>
		</button>

		<div id="collapsePlugins" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				{{{ each plugins }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin{./route}">{./name}</a>
				{{{ end }}}

				{{{ if authentication.length }}}
				<hr/>
				<div class="text-muted text-sm">[[admin/menu:section-social-auth]]</div>
				{{{ each authentication }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin{./route}">{./name}</a>
				{{{ end }}}
				{{{ end }}}
				<hr/>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/extend/plugins#download">[[admin/menu:extend/plugins.install]]</a>
			</div>
		</div>
	</div>
	{{{ end }}}
	{{{ end }}}

	{{{ if user.privileges.superadmin }}}
	<div class="d-flex flex-column">
		<button class="btn-ghost-sm justify-content-start" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAdvanced" aria-expanded="true" aria-controls="collapseAdvanced">
			<i class="fa fa-superpowers text-muted"></i>
			<div class="flex-1 font-serif text-sm fw-semibold">[[admin/menu:section-advanced]]</div>
		</button>

		<div id="collapseAdvanced" class="accordion-collapse collapse" data-bs-parent="#accordionACP">
			<div class="accordion-body py-1">
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/database">[[admin/menu:advanced/database]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/events">[[admin/menu:advanced/events]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/hooks">[[admin/menu:advanced/hooks]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/cache">[[admin/menu:advanced/cache]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/errors">[[admin/menu:advanced/errors]]</a>
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/advanced/logs">[[admin/menu:advanced/logs]]</a>
				{{{ if env }}}
				<a class="btn-ghost-sm justify-content-start text-decoration-none" href="{relative_path}/admin/development/logger">[[admin/menu:development/logger]]</a>
				{{{ end }}}
			</div>
		</div>
	</div>
	{{{ end }}}
  </div>