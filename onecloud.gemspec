# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onecloud/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '2.4.10'

  spec.name          = 'onecloud'
  spec.version       = Onecloud::VERSION
  spec.authors       = ['IlyaV']
  spec.email         = ['ilya@codeplay.ru']

  spec.summary       = 'API wrapper for 1Cloud'
  spec.description   = 'Onecloud - API wrapper for Russian cloud provider 1Cloud.ru'
  spec.homepage      = 'https://github.com/wimnorder/onecloud'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.metadata['allowed_push_host'] = 'https://rubygems.org' unless spec.respond_to?(:metadata)
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rubocop'
end
