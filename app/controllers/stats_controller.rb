class StatsController < ApplicationController
  before_filter :resource_user
  before_filter :require_login
  before_filter :require_equal_user

  def index
    @people = @user.people.find(params[:people])

    #magical
    @invite_time = ((@people.collect{|person| person.stddev}.sum/@people.count/2) + (@people.collect{|person| person.avg}.sum/@people.count)).floor.to_s + " minutes"

    #its called, pretend math
    @invite_probability = 85
  end
end
