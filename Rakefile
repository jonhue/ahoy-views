require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

system 'bundle'
system 'gem build ahoy-views.gemspec'


RSpec::Core::RakeTask.new

task default: :spec
