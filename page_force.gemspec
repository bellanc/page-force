# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'page-force/version'

Gem::Specification.new do |spec|
  spec.name          = "page-force"
  spec.version       = PageForce::VERSION
  spec.authors       = ["Branden Bellanca"]
  spec.email         = ["branden.bellanca@gmail.com"]

  spec.summary       = %q{Adds Salesforce field functionality to Page-Object.}
  spec.description   = %q{Adds Salesforce field functionality to Page-Object.}
  spec.homepage      = "https://github.com/bellanc/page-force"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "page-object", "~>1.1"
  spec.add_dependency "restforce"
  spec.add_dependency "activesupport"
end
