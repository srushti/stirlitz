require "spec_helper"

module Stirlitz
  describe Matchers do
    it "lets me know if a call had been made" do
      a_spy = spy(:spy)
      a_spy.a_method
      a_spy.should have_received(:a_method)
      lambda do
        a_spy.should_not have_received(:a_method)
      end.should raise_error
    end

    it "lets me know if certain arguments were used" do
      a_spy = spy(:spy)
      a_spy.a_method(10, 20)
      a_spy.should have_received(:a_method).with(10, 20)
    end

    it "fails when the method is called with different arguments" do
      a_spy = spy
      a_spy.a_method(30)
      lambda do
        a_spy.should have_received(:a_method).with(40)
      end.should raise_error
    end
  end
end
