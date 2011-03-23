module Stirlitz
  module Matchers
    # :call-seq:
    #   should have_received(expected_method)
    #   should have_received(expected_method).with(args)
    #   should_not have_received(expected)
    #
    # Passes if actual had expected invoked on it. You can also
    # pass args to verify that they were called with them
    #
    # == Examples
    #
    #   mock_object.should have_received(:save)
    #   mock_object.should have_received(:update_attributes).with({:name => 'new name'})
    #   mock_object.should_not have_received(:destroy)
    def have_received(expected)
      HaveReceived.new(expected)
    end

    class HaveReceived
      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        @actual = actual
        if @args
          actual.received_message?(@expected, *@args)
        else
          actual.received_message?(@expected)
        end
      end

      def with(*args)
        @args = args
        self
      end

      def failure_message_for_should
        if @args
          "#{@expected} should have been called on #{@actual.inspect} with #{@args.inspect}, but #{@actual.received_message?(@expected) ? ' was called with other arguments' : 'wasn\'t'}"
        else
          "#{@expected} should have been called on #{@actual.inspect}. but wasn't"
        end
      end

      def failure_message_for_should_not
        if @args
          "#{@expected} should not have been called on #{@actual.inspect} with #{@args.inspect}, but was"
        else
          "#{@expected} should not have been called on #{@actual.inspect}. but was"
        end
        "#{@expected} should not have been called on #{@actual.inspect}"
      end
    end
  end
end

RSpec.configure do |config|
  config.include Stirlitz::Matchers
end
