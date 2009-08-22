class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    #TODO: remove this
    #a simple stub:
    if @user.people.empty?
      %w{ Harry John Mark Stacey Jacob Matt Richard }.each{|name| @user.people.create(:name => name)}
    end
  end

end
