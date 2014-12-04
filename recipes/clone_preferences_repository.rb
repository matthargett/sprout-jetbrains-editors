preferences = node['sprout']['jetbrains-editors']['preferences']

git 'pivotal_ide_prefs' do
  destination preferences['clone_dir']
  repository preferences['repository']
  revision preferences['revision']
  action :sync
  user node['current_user']
end
