module Stirlitz
  module Spy
    def spy(name = nil, stubs_and_options = {})
      mock(name, stubs_and_options).as_null_object
    end
  end
end

module RSpec
  module Mocks
    module ExampleMethods
      include Stirlitz::Spy
    end
  end
end

