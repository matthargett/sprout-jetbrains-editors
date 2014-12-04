require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::intellij' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'clones the pivotal ide prefs repository' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-jetbrains-editors::clone_preferences_repository')
  end

  it 'runs the pivotal_ide_prefs install script with the intellij option' do
    runner.converge(described_recipe)
    expect(runner).to run_execute('install_intellij_prefs')
  end
end
