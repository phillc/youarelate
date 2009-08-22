class DashboardController < ApplicationController

  before_filter :require_user
  
  def show
    @user = User.find(params[:id])

    if @user != current_user
      redirect_to dashboard_path(current_user)
    end

    #TODO: remove this
    #a simple stub:
    if @user.people.empty?
      %w{ Harry John Mark Stacey Jacob Matt Richard }.each{|name| @user.people.create(:name => name)}
    end
  end

end
