# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hestia/version'

Gem::Specification.new do |spec|
  spec.name          = "hestia"
  spec.version       = Hestia::VERSION
  spec.authors       = ["Naoto SHINGAKI"]
  spec.email         = ["nao.sora+github@gmail.com"]

  spec.summary       = %q{Hestia is Plugbble scraping API}
  spec.description   = %q{Hestia is Plugbble scraping API}
  spec.homepage      = "https://github.com/naoto/hestia"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'rinne'
  spec.add_development_dependency 'nokogiri'
end
