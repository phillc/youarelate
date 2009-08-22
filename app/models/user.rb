# == Schema Information
# Schema version: 20090822022605
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
  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end
end
