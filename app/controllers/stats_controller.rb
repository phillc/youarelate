class StatsController < ApplicationController
  def index
    @user = User.find(params[:dashboard_id])
    @people = @user.people.find(params[:people])

    # TODO: stubbing
    @invite_time = DateTime.now
    @invite_probability = rand(30) + 70
  end
end
