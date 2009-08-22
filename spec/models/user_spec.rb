require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should be invalid when empty" do
    User.new.save.should == false
  end
  it "should be valid when given an username, email, and password with confirmation" do
    User.new(:username => "user", :email => "test@example.com", :password => "1234", :password_confirmation => "1234").save.should == true
  end
  it "should be valid when given only an openid url" do
    user = User.new(:openid_identifier => "https://www.google.com/accounts/o8/id")
    assert !user.save {}
  end
end
