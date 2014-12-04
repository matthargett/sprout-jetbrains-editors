include_recipe('sprout-jetbrains-editors::clone_preferences_repository')

preferences = node['sprout']['jetbrains-editors']['preferences']

execute 'install_intellij_prefs' do
  cwd preferences['clone_dir'] + '/cli'
  command 'bin/ide_prefs --ide=intellij install'
  user node['current_user']
end
