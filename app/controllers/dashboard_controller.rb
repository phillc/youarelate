class DashboardController < ApplicationController
  before_filter :dashboard_user
  before_filter :require_user
  before_filter :require_equal_user
  
  def show
    #TODO: remove this
    #a simple stub:
    if @user.people.empty?
      %w{ Harry John Mark Stacey Jacob Matt Richard }.each{|name| @user.people.create(:name => name)}
    end
  end

end
