require 'rails'
require 'rspec/core'
require 'rspec/mocks'
require 'rspec/rails/mocks'

class MockFactory

  VERSION = '0.0.2'

  class << self
    include RSpec::Rails::Mocks
    include RSpec::Mocks::ExampleMethods

    def create(const)
      name = const.is_a?(String) ? const : const.name
      @mocks ||= {}
      return @mocks[name] if @mocks[name]
      @mocks[name] = mock_model name
      yield @mocks[name] if block_given?
      @mocks[name]
    end

  end

end
