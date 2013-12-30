module Flowaker
  module RSpec
    def self.included(base)
      base.instance_eval do
        alias :flow :it
      end
    end

    def step(description, &block)
      yield
      reporter.example_passed StepExample.new(description, example.execution_result)
    end

    def reporter
      ::RSpec.configuration.reporter
    end

    class StepExample < Struct.new(:description, :execution_result); end
  end
end

::RSpec.configuration.include Flowaker::RSpec
