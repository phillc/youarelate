class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    @people = @user.people
    
    #TODO: remove this
    #a simple stub:
    if @people.empty?
      @people = %w{ Harry John Mark Stacey Jacob Matt Richard }.collect{|name| Person.create(:name => name)}
    end
  end

end
