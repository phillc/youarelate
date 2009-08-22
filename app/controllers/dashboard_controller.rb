class DashboardController < ApplicationController
  before_filter :require_user
  def show
    @user = current_user
    #TODO: remove this
    #a simple stub:
    if @user.people.empty?
      %w{ Harry John Mark Stacey Jacob Matt Richard }.each{|name| @user.people.create(:name => name)}
    end
  end

end
