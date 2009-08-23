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
  has_many :data_points, :dependent => :destroy, :order => :time_difference

  accepts_nested_attributes_for :data_points, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true

  validates_presence_of :name

  def chart_points
    #grab all the time diffentials, group them in groups of size
    group_size = 2
    
    dps = data_points.collect {|dp| (((dp.time_difference) / group_size).floor)*group_size}
    #the unique ones
    udps = dps.uniq
    #find their counts
    freq = udps.collect { |udp| dps.select {|td| td == udp}.length}
    #slap em together as a string
    [udps, freq].transpose.collect{|point| "[" + point * ", " + "]"} * ", "
  end

  def stddev(options = {})
    if data_points.count > 0:
      s = std_dev(data_points.collect(&:time_difference))
      if s.nan? || nil
        0
      else
        s
      end
    end
  end

  def avg(options={})
    data_points.average(:time_difference, options)
  end

  private

  def std_dev(list)  
    # Calculate neccesary values  
    list_squared = list.map {|item| item*item }  
    n = list.size  

    #Calculate the std deviation  
    right = (Float (sum(list)**2))/n  

    ((Float (sum(list_squared)) - right) / (n-1)) ** 0.5  
  end  

  def sum(list)  
    list.inject( nil ) { |sum,x| sum ? sum+x : x };  
  end 
end
