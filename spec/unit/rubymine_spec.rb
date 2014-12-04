require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::rubymine' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    runner.converge(described_recipe)
  end

  it 'installs rubymine' do
    expect(runner).to install_cask('rubymine')
  end

  it 'clones the pivotal ide prefs repository' do
    expect(runner).to include_recipe('sprout-jetbrains-editors::clone_preferences_repository')
  end

  it 'runs the pivotal_ide_prefs install script with the rubymine option' do
    expect(runner).to run_execute('install_rubymine_prefs')
  end
end
