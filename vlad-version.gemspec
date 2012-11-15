# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vlad/version/version'

Gem::Specification.new do |gem|
  gem.name          = 'vlad-version'
  gem.version       = Vlad::Version::VERSION
  gem.authors       = ['Andrew Marshall']
  gem.email         = ['andrew@johnandrewmarshall.com']
  gem.description   = %q{Vlad tasks for creating a version file & tag}
  gem.summary       = %q{Vlad tasks for creating a version file & tag}
  gem.homepage      = 'http://johnandrewmarshall.com/projects/vlad-version'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
