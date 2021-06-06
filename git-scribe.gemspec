lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git-scribe/version'

Gem::Specification.new do |gem|
  gem.name          = 'git-scribe'
  gem.version       = GitScribe::VERSION
  gem.authors       = ['Jack Bracken']
  gem.email         = ['contact@jacktrick.com']
  gem.description   = 'Generate and browse user statistics in git repos'
  gem.summary       = 'Generate and browse user statistics in git repos'
  gem.homepage      = 'https://github.com/JackBracken/git-scribe'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = Gem::Requirement.new('>= 1.9.2')

  gem.add_dependency('thor', '~> 1.1.0')
  gem.add_dependency('activesupport', '~> 6.1.3')
end