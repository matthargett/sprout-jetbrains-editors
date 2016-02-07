homebrew_cask 'android-studio'
include_recipe 'sprout-jetbrains-editors::clone_preferences_repository'
sprout_jetbrains_editors_pivotal_preferences 'androidstudio'
