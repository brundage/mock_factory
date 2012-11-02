$:.push File.expand_path("../lib", __FILE__)
require 'mock_factory'

Gem::Specification.new do |s|
  s.name          = "mock_factory"
  s.summary       = "Makes Factories for RSpec"
  s.description   = "See summary"

  s.homepage          = "https://github.com/brundage/mock_factory"
  s.rubyforge_project = "mock_factory"

  s.add_dependency 'rails'
  s.add_dependency 'rspec'
  s.add_dependency 'rspec-rails'

  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rb-inotify'

  s.authors       = ["Dean Brundage"]
  s.email         = ["dean@newrepublicbrewing.com"]

  s.files         = [ 'README.md', 'lib/mock_factory.rb' ]
  s.test_files    = [ 'spec/mock_factory_spec.rb' ]
  s.require_paths = ["lib"]

  s.platform      = Gem::Platform::RUBY
  s.version       = MockFactory::VERSION
end
