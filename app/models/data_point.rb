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

  before_save :calculate_difference

  def calculate_difference
    if time_difference.nil?
      differential = expected_time - actual_time
      hours, mins, secs, ignore_fractions = Date::day_fraction_to_time(differential)
      self.time_difference = hours * 60 + mins * 60 #we dont care about second
    end
  end

end
