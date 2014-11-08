require 'unit/spec_helper'
require 'pry'

describe 'sprout-pivotal-ide-prefs::rubymine' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'clones the pivotal ide prefs repository' do
    runner.converge(described_recipe)
    expect(runner).to sync_git('pivotal_ide_prefs')
  end

  it 'runs the pivotal-ide-prefs install script with the rubymine option' do
    runner.converge(described_recipe)
    expect(runner).to run_execute('install_rubymine_prefs')
  end
end
