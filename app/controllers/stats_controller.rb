class StatsController < ApplicationController
  def index
    @user = User.find(params[:dashboard_id])
    @people = @user.people.find(params[:people])

    # TODO: stubbing
    @invite_time = DateTime.now + rand(60).minutes + rand(24).hours + rand(15).days
    @invite_probability = rand(40) + 55
  end
end
