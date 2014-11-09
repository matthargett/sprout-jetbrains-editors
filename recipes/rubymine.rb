include_recipe('sprout-pivotal-ide-prefs::clone_preferences_repository')

preferences = node['sprout']['pivotal-ide-prefs']['preferences']

execute 'install_rubymine_prefs' do
  cwd preferences['clone_dir'] + '/cli'
  command 'bin/ide_prefs --ide=rubymine install'
  user node['current_user']
end
