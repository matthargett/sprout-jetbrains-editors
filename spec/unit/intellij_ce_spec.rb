require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij_ce' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'ensures that "caskroom/versions" is tapped' do
    runner.converge(described_recipe)
    expect(runner).to tap_homebrew_tap('caskroom/versions')
  end

  it 'installs intellij-ce' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('intellij-idea-ce')
  end

  it 'runs the pivotal_ide_prefs install script with the intellijcommunity option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('intellijcommunity')
  end
end
