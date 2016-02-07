include_recipe('sprout-base::workspace_directory')

preferences = node['sprout']['jetbrains-editors']['preferences']

git 'pivotal_ide_prefs' do
  destination preferences['clone_dir']
  repository preferences['repository']
  revision preferences['revision']
  action :sync
  user node['sprout']['user']
end
