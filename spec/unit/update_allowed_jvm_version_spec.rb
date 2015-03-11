require 'unit/spec_helper'
require 'pry'

describe 'the update_allowed_jvm_version LWRP' do
  let(:runner) { ChefSpec::SoloRunner.new(step_into: ['sprout_jetbrains_editors_update_allowed_jvm_version']) }
  let(:described_recipe) { 'sprout-jetbrains-editors::rubymine' }
  let(:jvm_version) { '1.6+' }
  let(:cmd) { "/usr/libexec/PlistBuddy -c 'Set :JVMOptions:JVMVersion #{jvm_version}' PLIST_FILE" }

  before do
    allow(Mixlib::ShellOut).to receive(:new).with(/rubymine/).and_return(
      double('shellout', run_command: nil, stdout: "  Foo.app (app)\n")
    )
  end

  it 'updates the JVMVersion for the application' do
    runner.converge(described_recipe)
    plist_cmd = cmd.gsub('PLIST_FILE', '/Applications/Foo.app/Contents/Info.plist')
    expect(runner).to run_execute(plist_cmd)
  end

  context 'when a jvm_version is specified' do
    let(:jvm_version) { '6.5.4.3.2.1' }
    before do
      runner.node.set['sprout']['jetbrains-editors']['application']['jvm_version'] = jvm_version
    end

    it 'updates the JVMVersion for the application with the correct version' do
      runner.converge(described_recipe)
      plist_cmd = cmd.gsub('PLIST_FILE', '/Applications/Foo.app/Contents/Info.plist')
      expect(runner).to run_execute(plist_cmd)
    end
  end

  context 'when a install_location is specified' do
    before do
      runner.node.set['sprout']['jetbrains-editors']['application']['install_location'] = '/Custom'
    end

    it 'updates the JVMVersion for the application in the correct location' do
      runner.converge(described_recipe)
      plist_cmd = cmd.gsub('PLIST_FILE', '/Custom/Foo.app/Contents/Info.plist')
      expect(runner).to run_execute(plist_cmd)
    end
  end

  context 'when the app name has spaces in it' do
    before do
      allow(Mixlib::ShellOut).to receive(:new).with(/rubymine/).and_return(
        double('shellout', run_command: nil, stdout: "  App With Spaces In The Name.app (app)\n")
      )
    end

    it 'updates the JVMVersion for the application' do
      runner.converge(described_recipe)
      plist_cmd = cmd.gsub('PLIST_FILE', '/Applications/App\ With\ Spaces\ In\ The\ Name.app/Contents/Info.plist')
      expect(runner).to run_execute(plist_cmd)
    end
  end

  context 'when the allow_latest_java is set to false' do
    before do
      runner.node.set['sprout']['jetbrains-editors']['application']['allow_latest_java'] = false
    end

    it 'does not update the JVMVersion for the applicaiton' do
      runner.converge(described_recipe)
      plist_cmd = cmd.gsub('PLIST_FILE', '/Applications/Foo.app/Contents/Info.plist')
      expect(runner).to_not run_execute(plist_cmd)
    end
  end
end
