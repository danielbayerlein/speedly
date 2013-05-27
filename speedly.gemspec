# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'speedly/version'

Gem::Specification.new do |gem|
  gem.name          = 'speedly'
  gem.version       = Speedly::VERSION
  gem.authors       = ['Daniel Bayerlein']
  gem.email         = ['daniel.bayerlein@googlemail.com']
  gem.description   = 'A CLI tool to test your page speed performance.'
  gem.summary       = 'Speedly is a simple CLI tool to test your page speed ' \
                      'performance. It works with YSlow.'
  gem.homepage      = 'https://github.com/danielbayerlein/speedly'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'json', '~> 1.8.0'
  gem.add_runtime_dependency 'slop', '~> 3.4.5'
  gem.add_runtime_dependency 'term-ansicolor', '~> 1.2.1'

  gem.add_development_dependency 'rspec', '~> 2.13.0'
  gem.add_development_dependency 'fuubar', '~> 1.1.0'
end
