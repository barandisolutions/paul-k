require File.dirname(__FILE__) + '/../spec_helper'

describe Reservation do
  it "should be valid" do
    Reservation.new.should be_valid
  end
end
