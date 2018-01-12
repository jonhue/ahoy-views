# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'ahoy', 'views', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'ahoy-views'
    gem.version               = Ahoy::Views::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Track views of ActiveRecord objects in Rails'
    gem.description           = 'Track views of ActiveRecord objects in Rails.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/ahoy-views'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*']
    gem.require_paths         = ['lib']

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activerecord', '>= 5.0'
    gem.add_dependency 'actionview', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
