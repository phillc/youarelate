class StatsController < ApplicationController
  before_filter :resource_user
  before_filter :require_user
  before_filter :require_equal_user

  def index
    @people = @user.people.find(params[:people])

    # TODO: stubbing
    @invite_time = DateTime.now + rand(60).minutes + rand(24).hours + rand(15).days
    @invite_probability = rand(40) + 55
  end
end
