require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij_ce' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    runner.converge(described_recipe)
  end

  it 'installs intellij-ce' do
    expect(runner).to install_cask('intellij-idea-ce')
  end

  it 'runs the pivotal_ide_prefs install script with the intellijcommunity option' do
    expect(runner).to install_preferences('intellijcommunity')
  end
end
