require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DataPoint do
  before(:each) do
    @valid_attributes = {
      :expected_time => Time.now,
      :actual_time => Time.now,
      :time_difference => 1,
      :person_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    DataPoint.create!(@valid_attributes)
  end
end
