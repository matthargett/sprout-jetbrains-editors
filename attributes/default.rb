default['sprout']['jetbrains-editors']['preferences']['repository'] =
  'https://github.com/pivotal/pivotal_ide_prefs.git'

default['sprout']['jetbrains-editors']['preferences']['clone_dir'] =
  "#{node['sprout']['home']}/#{node['workspace_directory']}/pivotal_ide_prefs"

default['sprout']['jetbrains-editors']['preferences']['revision'] = 'master'
