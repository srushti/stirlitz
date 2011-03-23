require "spec_helper"

module Stirlitz
  describe Spy do
    it "extends rspec mock" do
      a_spy = spy("something", :method_1 => 1, :method_two => 'two')
      a_spy.method_1.should == 1
      a_spy.method_two.should == 'two'
    end

    it "doesn't complain about undeclared methods" do
      a_spy = spy("something", :method_1 => 1, :method_two => 'two')
      lambda do
        a_spy.a_method_no_one_knows_about.should
      end.should_not raise_error
    end
  end
end
