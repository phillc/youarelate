class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@people = user.people
    #a simple stub:
    @people = %w{ Harry John Mark Stacey Jacob Matt Richard }.collect{|name| Person.new(:name => name)}
  end

end
