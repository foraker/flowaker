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
      reporter.example_passed ::Flowaker::Example.new(description, example)
    end

    def reporter
      ::RSpec.configuration.reporter
    end
  end

  class Example < SimpleDelegator
    def initialize(description, example)
      @description = description
      super(example)
    end

    attr_reader :description
  end
end

::RSpec.configuration.include Flowaker::RSpec
