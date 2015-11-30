require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::android_studio' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs android studio' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('android-studio')
  end

  it 'runs the pivotal_ide_prefs install script with the androidstudio option' do
    runner.converge(described_recipe)
    expect(runner).to install_preferences('androidstudio')
  end
end
