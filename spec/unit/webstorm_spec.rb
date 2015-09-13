require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::webstorm' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs webstorm' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('webstorm')
  end

  it 'runs the pivotal_ide_prefs install script with the webstorm option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('webstorm')
  end

  it 'attempts to update the allowed jvm version' do
    runner.converge(described_recipe)
    expect(runner).to update_allowed_jvm_version('webstorm')
  end
end
