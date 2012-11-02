require 'rspec/core'
require 'rspec/mocks'
require 'rspec/rails/mocks'

class MockFactory

  VERSION = '0.0.7'

  class << self
    include RSpec::Rails::Mocks

    def fetch(const, &block)
      mock_it :fetch, const, &block
    end


    def produce(const, &block)
      mock_it :produce, const, &block
    end

  private

    def fecth_mock(name)
      unless @mocks.has_key?(name)
        @mocks[name] = produce_mock(name)
      end
      @mocks[name]
    end


    def mock_it(action, const, &block)
      setup
      name = const.is_a?(String) ? const : const.name
      mock_object = action == :fetch ? fecth_mock(name) : produce_mock(name)
      block.call(mock_object) if block
      mock_object
    end


    def produce_mock(name)
      mock_model name
    end


    def setup
      @mocks ||= {}
      @space ||= RSpec::Mocks::setup(self)
    end

  end

end
