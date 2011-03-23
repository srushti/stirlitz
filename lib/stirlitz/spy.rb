module Stirlitz
  class Spy < RSpec::Mocks::Mock
    def initialize(name = nil, stubs_and_options = {})
      super(name, stubs_and_options)
    end

    def self.spy(name, args)
      mock(name, args)
    end
  end
end
