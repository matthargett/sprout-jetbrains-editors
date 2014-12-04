require 'rspec'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

def install_cask(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:sprout_homebrew_cask, :install, resource_name)
end
