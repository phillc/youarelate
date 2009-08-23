class DashboardController < ApplicationController
  before_filter :dashboard_user
  before_filter :require_user
  before_filter :require_equal_user
  
  def show
  end

end
