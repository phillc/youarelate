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
        :notes => "This guy is ALWAYS late. Invite with caution",
      },
      {
        :name => "Harry",
        :notes => "Fun... most of the time. Invite sparingly",
      },
      {
        :name => "John",
        :notes => "Likes to hit on random girls, sexual harassment lawsuit pending.",
      },
      {
        :name => "Mark",
        :notes => "Drives a Ferrarri, average speed of 100mph. Never late.",
      },
      {
        :name => "Stacey",
        :notes => "Has an interesting mother, keeps things entertaining. Would invite again, A++++++",
      },
      {
        :name => "Christy",
        :notes => "Cool girl, goes by the rapper name XT (Chris-T). Wears a clock around her neck, so she's normally on time.",
      },
      {
        :name => "Matt",
        :notes => "Went to vegas and put all his money on red. Tells great stories! Invite often.",
      },
      {
        :name => "Richard",
        :notes => "Never on time, inviter beware.",
      }
    ].each do |peep|
      p = Person.new(:name => peep[:name], :notes => peep[:notes])
      n = rand(15) + 10
      personality = rand(15) - 5
      n.times do
        r = rand(16 + 24)
        if r > 16
          #for weight
          #
          #distance over 16
          #divide by four to close range
          #max of range 6, avg 3, so add it to 3 below middle of regular range (16/2)-3=5
          r = ((r - 16) / 4) + 5
        end
        r = r - 3
        diff = personality + r
        p.data_points.build(:time_difference => diff)
      end

      people << p
    end
  end
end
