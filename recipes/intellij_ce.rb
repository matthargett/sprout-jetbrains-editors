homebrew_tap 'caskroom/versions'
homebrew_cask 'intellij-idea-ce'
include_recipe 'sprout-jetbrains-editors::clone_preferences_repository'
sprout_jetbrains_editors_pivotal_preferences 'intellijcommunity'
