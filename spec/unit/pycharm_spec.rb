require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::pycharm' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs pycharm' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('pycharm')
  end

  it 'runs the pivotal_ide_prefs install script with the pycharm option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('pycharm')
  end
end
