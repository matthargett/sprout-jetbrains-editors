require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij_ce' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs intellij-ce' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('intellij-idea-ce')
  end

  it 'runs the pivotal_ide_prefs install script with the intellijcommunity option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('intellijcommunity')
  end

  it 'attempts to update the allowed jvm version' do
    runner.converge(described_recipe)
    expect(runner).to update_allowed_jvm_version('intellij-idea-ce')
  end
end
