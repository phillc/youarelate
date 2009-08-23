class StatsController < ApplicationController
  before_filter :resource_user
  before_filter :require_login
  before_filter :require_equal_user

  def index
    @people = @user.people.find(params[:people])

    #magical
    magic_stddev = (@people.collect{|person| person.stddev}.sum/@people.count/2) 
    magic_avg = (@people.collect{|person| person.avg}.sum/@people.count)
    @invite_time = (magic_stddev + magic_avg).floor.to_s + " minutes"

    #Ben: "Its called, pretend math"
    coeff_var = (magic_stddev) / magic_avg
    magical_number = 100 - (coeff_var*100)/magic_stddev
    if magical_number < 50
      @invite_probability = "<50"
    else
      @invite_probability = magical_number.truncate.to_s
    end

  end
end
