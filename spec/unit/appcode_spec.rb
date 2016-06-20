require 'unit/spec_helper'
require 'pry'

describe 'sprout-jetbrains-editors::appcode' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'installs appcode' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('appcode')
  end

  it 'attempts to update the allowed jvm version' do
    runner.converge(described_recipe)
    expect(runner).to update_allowed_jvm_version('appcode')
  end
end
