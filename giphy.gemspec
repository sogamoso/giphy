# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'giphy/version'

Gem::Specification.new do |spec|
  spec.name          = "giphy"
  spec.version       = Giphy::VERSION
  spec.authors       = ["Sebastian Sogamoso"]
  spec.email         = ["sebasoga@gmail.com"]
  spec.description   = %q{A Ruby interface to the Giphy API.}
  spec.summary       = %q{Enjoy Giphy API from you Ruby programs and command line}
  spec.homepage      = "http://github.com/sebasoga/giphy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rspec-its", "~> 1.0"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.9"
  spec.add_dependency "faraday_middleware-parse_oj", "~> 0.3"
  spec.add_dependency "launchy", "~> 2.4"
end
