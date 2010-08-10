require File.dirname(__FILE__) + '/../spec_helper'

describe Calender do
  it "should be valid" do
    Calender.new.should be_valid
  end
end
