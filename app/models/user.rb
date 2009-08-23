# == Schema Information
# Schema version: 20090823033627
#
# Table name: users
#
#  id           :integer         not null, primary key
#  identity_url :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class User < ActiveRecord::Base
  has_many :people, :dependent => :destroy

  validates_presence_of :identity_url

  before_save :populate_starter_data

  def populate_starter_data
    #TODO: change this
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
      p = Person.new(:name => peep[:name], :notes => peep[:notes])
      n = rand(12) + 4
      n.times do
        pick = rand(4)
        case pick
          when 0..2
            dt = DateTime.now - rand(50).days - rand(24).hours - rand(60).minutes
            p.data_points.build(:expected_time => dt, :actual_time => dt + (rand(100) -50).minutes)
          when 3
            p.data_points.build(:time_difference => rand(100) - 50)
        end
      end

      people << p
    end
  end
end
