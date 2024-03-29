# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |gem|
  gem.name          = "rulers"
  gem.version       = Rulers::VERSION
  gem.authors       = ['Not really rking']
  gem.email         = ['rking-rulers@sharpsaw.org']
  gem.description   = %q{Decomposition of Rack frameworks}
  gem.summary       = %q{…}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/).grep /^(?!best_quotes)/
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  %w(rack erubis).each do |e| gem.add_dependency e end
  gem.add_development_dependency 'rake'
end
