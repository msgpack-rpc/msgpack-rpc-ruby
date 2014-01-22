require 'rake'
require 'rake/testtask'
require 'rake/clean'

require 'bundler'
Bundler::GemHelper.install_tasks

task :default => [:build]

task :test => ['test:unit','spec:unit']
load 'tasks/msgpack_rpc_tasks.rake'
