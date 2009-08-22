require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should be invalid when empty" do
    User.new.save.should == false
  end
end
