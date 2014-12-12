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

  it 'runs the pivotal_ide_prefs install script with the rubymine option' do
    expect(runner).to install_preferences('rubymine')
  end
end
