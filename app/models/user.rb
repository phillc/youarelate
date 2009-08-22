# == Schema Information
# Schema version: 20090822195053
#
# Table name: users
#
#  id                :integer         not null, primary key
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  openid_identifier :string(255)
#  username          :string(255)
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
    c.validate_login_field = false
    c.validate_email_field = false
  end

  has_many :people





  private

  def map_openid_registration(registration)
    self.email = registration["email"]
    self.username = registration["nickname"]
  end
end
