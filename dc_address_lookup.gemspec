# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dc_address_lookup/version'

Gem::Specification.new do |spec|
  spec.name          = "dc_address_lookup"
  spec.version       = DcAddressLookup::VERSION
  spec.authors       = ["Ben Balter"]
  spec.email         = ["ben.balter@github.com"]

  spec.summary       = "A Ruby gem to look up Washington, D.C. addresses in the master address registry, an official city database"
  spec.homepage      = "https://github.com/benbalter/dc-address-lookup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.8"
  spec.add_dependency "rest-client-components", "~> 1.4"
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "rack-cache", "~> 1.5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry", "~> 0.10"
end
