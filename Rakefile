require 'rubygems'
require 'bundler/setup'

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet/version'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

begin
    require 'puppet_blacksmith/rake_tasks'
rescue LoadError
end

Rake::Task[:lint].clear


PuppetLint.configuration.send('disable_80chars')

exclude_paths = [
  "bundle/**/*",
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]
PuppetSyntax.exclude_paths = exclude_paths
PuppetLint.configuration.ignore_paths = exclude_paths

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec,
  :metadata_lint,
]
