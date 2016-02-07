require 'spec_helper'

describe 'sprout-jetbrains-editors' do
  it 'converges without errors' do
    expect(system('soloist')).to eq(true)
  end

  describe 'installing each editor' do
    subject(:installed_casks) { `/usr/local/bin/brew cask list 2>/dev/null` }

    it { is_expected.to include 'android-studio' }
    it { is_expected.to include 'intellij-idea' }
    it { is_expected.to include 'intellij-idea-ce' }
    it { is_expected.to include 'pycharm' }
    it { is_expected.to include 'rubymine' }
    it { is_expected.to include 'webstorm' }
  end

  it 'clones the preferences repository' do
    expect(File).to be_exists("#{ENV['HOME']}/workspace/pivotal_ide_prefs")
  end
end
