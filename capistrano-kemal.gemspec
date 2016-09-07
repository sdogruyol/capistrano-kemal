# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/kemal/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-kemal"
  spec.version       = Capistrano::Kemal::VERSION
  spec.authors       = ["Serdar Dogruyol"]
  spec.email         = ["dogruyolserdar@gmail.com"]

  spec.summary       = %q{Capistrano integration for Kemal}
  spec.description   = %q{Capistrano integration for Kemal}
  spec.homepage      = "https://github.com/sdogruyol/capistrano-kemal"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
