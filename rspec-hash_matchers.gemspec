# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/hash_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-hash_matchers"
  spec.version       = RSpec::HashMatchers::VERSION
  spec.authors       = ["Oded Niv"]
  spec.email         = ["oded.niv@gmail.com"]

  spec.summary       = %q{Better matchers for hashes.}
  spec.description   = %q{RSpec extension to better match hashes.}
  spec.homepage      = "https://github.com/odedniv/rspec-hash_matchers"
  spec.license       = "UNLICENSE"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec-expectations", ">= 3.0"
  spec.add_runtime_dependency "activesupport", ">= 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
