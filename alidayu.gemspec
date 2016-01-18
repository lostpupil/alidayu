# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alidayu/version'

Gem::Specification.new do |spec|
  spec.name          = "alidayu"
  spec.version       = Alidayu::VERSION
  spec.authors       = ["banana"]
  spec.email         = ["banana@eurus.cn"]

  spec.summary       = %q{a gem to use alidayu service}
  spec.description   = %q{a gem to use sms service with alidayu}
  spec.homepage      = "https://github.com/lostpupil/alidayu/tree/master"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
