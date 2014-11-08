default['sprout']['pivotal-ide-prefs']['preferences']['repository'] =
  'https://github.com/pivotal/pivotal_ide_prefs.git'

default['sprout']['pivotal-ide-prefs']['preferences']['clone_dir'] =
  "#{Chef::Config[:file_cache_path]}/pivotal_ide_prefs"

default['sprout']['pivotal-ide-prefs']['preferences']['revision'] = 'master'
