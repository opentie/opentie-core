# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opentie/core/version'

Gem::Specification.new do |spec|
  spec.name          = "opentie-core"
  spec.version       = Opentie::Core::VERSION
  spec.authors       = ["polamjag"]
  spec.email         = ["s@polamjag.info"]
  spec.summary       = %q{core library for opentie project}
  spec.homepage      = "https://github.com/opentie/opentie-core"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "mongoid"
  spec.add_development_dependency "mongoid-tree"
  spec.add_development_dependency "mongoid-enum"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "database_cleaner"
end
