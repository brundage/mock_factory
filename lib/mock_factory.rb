require 'rspec/core'
require 'rspec/mocks'
require 'rspec/rails/mocks'

class MockFactory

  VERSION = '0.0.4'

  class << self
    include RSpec::Rails::Mocks

    def create(const, &block)
      mock_it 'create', const, &block
    end


    def fetch(const, &block)
      mock_it 'fetch', const, &block
    end

  private

    def mock_it(action, const, &block)
      setup
      name = const.is_a?(String) ? const : const.name

      mock_object = if action == 'fetch'
                      @mocks[name] ||= mock_model name
                    else
                      mock_model name
                    end

      block.call(mock_object) if block
      mock_object
    end


    def setup
      @mocks ||= {}
      @space ||= RSpec::Mocks::setup(self)
    end


  end

end
