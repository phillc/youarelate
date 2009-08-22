# == Schema Information
# Schema version: 20090822210831
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  crypted_password   :string(255)
#  password_salt      :string(255)
#  persistence_token  :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  openid_identifier  :string(255)
#  login              :string(255)
#  login_count        :integer         default(0), not null
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
    c.validate_login_field = false
    c.validate_email_field = false
  end

  has_many :people, :dependent => :destroy

  private

    def map_openid_registration(registration)
      self.email = registration["email"]
      self.username = registration["nickname"]
    end
end
