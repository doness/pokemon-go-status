# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'melonsmasher/pokemon_go_status/version'

Gem::Specification.new do |spec|
  spec.name          = "pokemon_go_status"
  spec.version       = '0.0.2'
  spec.authors       = ["Alex Markessinis"]
  spec.email         = ["markea125@gmail.com"]

  spec.summary       = %q{Can I catch'em all?!}
  spec.description   = %q{A simple way to determine if Pokemon Go is available.}
  spec.homepage      = "https://github.com/MelonSmasher/pokemon-go-status"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["pgo-status"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
