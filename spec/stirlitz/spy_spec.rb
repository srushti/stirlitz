require "spec_helper"

module Stirlitz
  describe Spy do
    it "extends rspec mock" do
      a_spy = Spy.new("something", :method_1 => 1, :method_two => 'two')
      a_spy.method_1.should == 1
      a_spy.method_two.should == 'two'
    end
  end
end
