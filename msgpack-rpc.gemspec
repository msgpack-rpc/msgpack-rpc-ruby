$:.push File.expand_path("../lib", __FILE__)
require 'msgpack/rpc/version'

Gem::Specification.new do |s|
  s.name = "msgpack-rpc"
  s.version = MessagePack::RPC::VERSION
  s.authors = ["FURUHASHI Sadayuki", "Shuzo Kashihara"]
  s.email = ["frsyuki@users.sourceforge.jp", "suma@users.sourceforge.jp"]
  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.license = "Apache 2.0"
  s.homepage = "http://msgpack.org/"
  s.require_paths = ["lib"]
  s.summary = "MessagePack-RPC, asynchronous RPC library using MessagePack"

  s.add_runtime_dependency "msgpack", ["~> 0.5.10"]
  s.add_runtime_dependency "cool.io", ["~> 1.4.3"]
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "test-unit"
  s.add_development_dependency 'bundler', ["~> 1.0"]
end

