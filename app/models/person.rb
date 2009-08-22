# == Schema Information
# Schema version: 20090822022605
#
# Table name: people
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  belongs_to :user
  has_many :datas
end
