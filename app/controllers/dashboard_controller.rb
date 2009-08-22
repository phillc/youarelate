class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    @people = @user.people
    
    #TODO: remove this
    #a simple stub:
    if @people.empty?
      %w{ Harry John Mark Stacey Jacob Matt Richard }.each{|name| @user.people.create(:name => name)}
      @people = @user.people
    end
  end

end
