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

  #before_save :populate_starter_data


  def populate_starter_data
    #TODO: change this
    #
    [
      {
        :name => "Drew",
        :notes => "This mother fucker is always late.",
      },
      {
        :name => "Harry",
        :notes => "Heh, I bet his variance is a little crazy",
      },
      {
        :name => "John",
        :notes => "Rofl, what can I say about this strange man?",
      },
      {
        :name => "Mark",
        :notes => "Well, I once saw him going 100 mph... how can he ever be late like that?",
      },
      {
        :name => "Stacey",
        :notes => "If she wasn't hot, we would have big problems",
      },
      {
        :name => "Christy",
        :notes => "She isn't hot. We have big problems.",
      },
      {
        :name => "Matt",
        :notes => "I guess he could... remote in...",
      },
      {
        :name => "Richard",
        :notes => "last time he was on time was back when he was still sucking his mother's nip",
      }
    ].each do |peep|
      n = rand(12)
      n.times do
        pick = rand(4)
        case pick
          when 0..2
            self.people.build.data_points.build(:expected_time => DateTime.now - rand(50).days - rand(24).hours - rand(60).minutes)
          when 3
            self.people.build.data_points.build(:time_difference => rand(100) - 50)
        end
      end
    end
                               
  end









  private

    def map_openid_registration(registration)
      self.email = registration["email"]
      self.username = registration["nickname"]
    end
end
