include_recipe('sprout-jetbrains-editors::clone_preferences_repository')

preferences = node['sprout']['jetbrains-editors']['preferences']

execute 'install_rubymine_prefs' do
  cwd preferences['clone_dir'] + '/cli'
  command 'bin/ide_prefs --ide=rubymine install'
  user node['current_user']
end
