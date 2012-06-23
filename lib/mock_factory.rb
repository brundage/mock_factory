require 'rails'
require 'rspec/core'
require 'rspec/mocks'
require 'rspec/rails/mocks'

class MockFactory

  VERSION = '0.0.3'

  class << self
    include RSpec::Rails::Mocks

    def create(const)
      name = const.is_a?(String) ? const : const.name
      setup
      return @mocks[name] if @mocks[name]
      @mocks[name] = mock_model name
      yield @mocks[name] if block_given?
      @mocks[name]
    end

  protected

    def setup
      @mocks ||= {}
      @space ||= RSpec::Mocks::setup(self)
    end

  end

end
