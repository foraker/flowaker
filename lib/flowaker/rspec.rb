require 'delegate'

module Flowaker
  module RSpec
    def self.included(base)
      base.instance_eval do
        alias :flow :it
      end
    end

    def step(description, &block)
      yield
      example = ::RSpec::Core::Example.new(self.class, description, {})
      reporter.example_passed example
    end

    def reporter
      ::RSpec.configuration.reporter
    end
  end
end

::RSpec.configuration.include Flowaker::RSpec
