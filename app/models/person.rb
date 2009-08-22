# == Schema Information
# Schema version: 20090822203754
#
# Table name: people
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Person < ActiveRecord::Base
  belongs_to :user
  has_many :data_points, :dependent => :destroy

  accepts_nested_attributes_for :data_points, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true

  validates_presence_of :name
  
  # stub for now
  # TODO: delete this
  def notes
    <<-eos
      Lorem ipsum dolor sit amet, consectetur magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.  Excepteur sint occaecat
      cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
      est laborum
    eos
  end
end
