# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usda_market/version'

Gem::Specification.new do |spec|
  spec.name          = 'usda_market'
  spec.version       = UsdaMarket::VERSION
  spec.authors       = ['Andrew Medeiros']
  spec.email         = %w(amedeiros0920@gmail.com)
  spec.summary       = %q{USDA Market is a small library for interacting with the USDA's farmers market api.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'shoulda'
end
