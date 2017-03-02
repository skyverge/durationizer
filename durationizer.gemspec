# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'durationizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'durationizer'
  spec.version       = Durationizer::VERSION
  spec.authors       = ['Hannes Benson', 'Lucas Lessa', 'Daniel Madrid', 'Emily Moss', 'Max Rice',
                        'Justin Stern']
  spec.email         = ['help@shopstorm.com']

  spec.summary       = 'Convert integer column to ActiveSupport::Duration'
  spec.description   = ''
  spec.homepage      = 'https://github.com/skyverge/durationizer'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4.2'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_development_dependency 'maxitest', '~> 2.4'
  spec.add_development_dependency 'shop_storm_cops', '~> 0.2'
end
