require 'bundler'
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require 'rake/testtask'
require 'rake/clean'

task :default => [:build]

task :test => [:spec]

namespace :test do
  desc "run test"
  Rake::TestTask.new(:unit) do |t|
    t.libs << 'lib'
    t.pattern = 'test/*_test.rb'
    t.verbose = true
  end
end
