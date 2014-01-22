$:.push File.expand_path("../lib", __FILE__)
require 'msgpack/rpc/version'

Gem::Specification.new do |s|
  s.name = "msgpack-rpc"
  s.version = MessagePack::RPC::VERSION
  s.authors = ["FURUHASHI Sadayuki"]
  s.email = "frsyuki@users.sourceforge.jp"
  s.files = `git ls-files`.split("\n")
  s.test_files = ["test/test_helper.rb"]
  s.license = "Apache 2.0"
  s.homepage = "http://msgpack.org/"
  s.require_paths = ["lib"]
  s.rubyforge_project = "msgpack"
  s.summary = "MessagePack-RPC, asynchronous RPC library using MessagePack"

  s.add_runtime_dependency "msgpack", ["~> 0.5.8"]
  s.add_runtime_dependency "cool.io", ["~> 1.1.1"]
  s.add_development_dependency "rspec", [">= 0"]
  s.add_development_dependency 'bundler', ["~> 1.0"]
end

