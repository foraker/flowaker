# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flowaker/version'

Gem::Specification.new do |spec|
  spec.name          = "flowaker"
  spec.version       = Flowaker::VERSION
  spec.authors       = ["Jon Evans"]
  spec.email         = ["jle@foraker.com"]
  spec.description   = %q{Flowaker-ize your specs}
  spec.summary       = %q{Organize your specs into flows}
  spec.homepage      = "https://github.com/foraker/flowaker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
