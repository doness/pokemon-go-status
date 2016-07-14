# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'melonsmasher/pokemon-go-status/version'

Gem::Specification.new do |spec|
  spec.name          = "pokemon-go-status"
  spec.version       = '0.0.6'
  spec.authors       = ["Alex Markessinis"]
  spec.email         = ["markea125@gmail.com"]

  spec.summary       = %q{Can I catch'em all?!}
  spec.description   = %q{A simple way to determine if Pokemon Go is available.}
  spec.homepage      = "https://github.com/MelonSmasher/pokemon-go-status"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["pgo-status"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
