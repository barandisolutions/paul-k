require File.dirname(__FILE__) + '/../spec_helper'

describe Reservations do
  it "should be valid" do
    Reservations.new.should be_valid
  end
end
