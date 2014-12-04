require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    runner.converge(described_recipe)
  end

  it 'installs intellij' do
    expect(runner).to install_cask('intellij-idea')
  end

  it 'clones the pivotal ide prefs repository' do
    expect(runner).to include_recipe('sprout-jetbrains-editors::clone_preferences_repository')
  end

  it 'runs the pivotal_ide_prefs install script with the intellij option' do
    expect(runner).to run_execute('install_intellij_prefs')
  end
end
