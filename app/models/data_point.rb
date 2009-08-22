# == Schema Information
# Schema version: 20090822203754
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
#

class DataPoint < ActiveRecord::Base
  belongs_to :person
end
