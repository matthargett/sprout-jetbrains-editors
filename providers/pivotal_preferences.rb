use_inline_resources

action :install do
  run_context.include_recipe 'sprout-jetbrains-editors::clone_preferences_repository'
  package = new_resource.name
  preferences = node['sprout']['jetbrains-editors']['preferences']

  execute 'install_intellij_prefs' do
    cwd preferences['clone_dir'] + '/cli'
    command "bin/ide_prefs --ide=#{package} install"
    user node['sprout']['user']
  end

  new_resource.updated_by_last_action(true)
end
