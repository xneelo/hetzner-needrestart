source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :test do
  gem 'voxpupuli-test',  '~> 13.0', require: false
  gem 'puppet_metadata', '~> 5.0',  require: false
end

group :release do
  gem 'voxpupuli-release', '~> 4.0', require: false
end

puppet_version = ENV['PUPPET_GEM_VERSION']
gem 'puppet', puppet_version, require: false if puppet_version
