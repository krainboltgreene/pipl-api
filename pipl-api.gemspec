# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pipl/api/version"

Gem::Specification.new do |spec|
  spec.name          = "pipl-api"
  spec.version       = Pipl::API::VERSION
  spec.authors       = ["Kurtis Rainbolt-Greene"]
  spec.email         = ["me@kurtisrainboltgreene.name"]
  spec.summary       = %q{An interface for the Pipl API}
  spec.description   = spec.summary
  spec.homepage      = "http://krainboltgreene.github.com/pipl-api"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = Dir["bin/**/*"].map! { |f| f.gsub(/bin\//, '') }
  spec.test_files    = Dir["test/**/*", "spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "multi_json", "~> 1.7"
  spec.add_runtime_dependency "rest-client", "~> 1.6"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "kramdown"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "json", "~> 1.7"
  spec.add_development_dependency "m"
end
