# This provider is for JetBrains IDEs from before November 2015,
# after which the editors come bundled with custom JVM versions.
# Therefore, only run this provider if using older JetBrains IDEs.
use_inline_resources

action :install do
  jvm_version  = node['sprout']['jetbrains-editors']['application']['jvm_version']
  plist_key    = ':JVMOptions:JVMVersion'
  application_root = node['sprout']['jetbrains-editors']['application']['install_location']

  cask_name = new_resource.name
  cask_info = Mixlib::ShellOut.new("brew cask info #{cask_name}|grep '(app)'")
  cask_info.run_command
  app = cask_info.stdout.strip.gsub(/(.*) \(app\)/, '\1').gsub(' ', '\ ')
  plist_file = ::File.join(application_root, app, 'Contents', 'Info.plist')
  update = execute "/usr/libexec/PlistBuddy -c 'Set #{plist_key} #{jvm_version}' #{plist_file}" do
    only_if { node['sprout']['jetbrains-editors']['application']['allow_latest_java'] }
  end

  new_resource.updated_by_last_action(update.updated_by_last_action?)
end
