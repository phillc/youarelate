# == Schema Information
# Schema version: 20090823033627
#
# Table name: data_points
#
#  id              :integer         not null, primary key
#  expected_time   :datetime
#  actual_time     :datetime
#  time_difference :integer
#  person_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#

class DataPoint < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :time_difference
  validates_numericality_of :time_difference


end
