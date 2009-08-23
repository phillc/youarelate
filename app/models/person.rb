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

  def chart_points
    data_points.collect {|dp| "[" + [dp.time_difference, rand(7)].join(", ") + "]"}.join(", ")
  end

  # Calculates the standard deviations on a given column. The value returned is a Float. 
  #
  # Person.stddev('age')
  def stddev(options = {})
    data_points.calculate(:stddev, :expected_time, options)
  end

  # Calculates the standard popular deviation on a given column. The value returned is a Float.
  #
  # Person.stddev_pop('age')
  def stddev_pop(options = {})
    data_points.calculate(:stddev_pop, :expected_time, options)
  end

  # Calculates the standard sample deviations on a given column. The value return is a Float. 
  #
  # Person.stddev_samp('age')
  def stddev_samp(options = {})
    data_points.calculate(:stddev_samp, :expected_time, options)
  end 

end
