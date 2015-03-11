require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs intellij' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('intellij-idea')
  end

  it 'runs the pivotal_ide_prefs install script with the intellij option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('intellij')
  end

  it 'attempts to update the allowed jvm version' do
    runner.converge(described_recipe)
    expect(runner).to update_allowed_jvm_version('intellij-idea')
  end
end
