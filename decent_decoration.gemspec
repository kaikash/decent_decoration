# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decent_decoration/version'

Gem::Specification.new do |gem|
  gem.name          = "decent_decoration"
  gem.version       = DecentDecoration::VERSION
  gem.authors       = ["Tomasz Pewiński"]
  gem.email         = ["pewniak747@gmail.com"]
  gem.description   = %q{Use decent_exposure with decorators (e.g. Draper)}
  gem.summary       = %q{Use decent_exposure with decorators (e.g. Draper)}
  gem.homepage      = "https://github.com/netguru/decent_decoration"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency     'decent_exposure', '~> 3.0'
  gem.add_development_dependency 'rspec-rails', "~> 3.0"
  gem.add_development_dependency 'rails', '~> 4.0'
  gem.add_development_dependency 'activesupport', '~> 4.0'
  gem.add_development_dependency 'draper', '~> 2.1'
end
