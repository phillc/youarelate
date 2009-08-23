class DashboardController < ApplicationController
  before_filter :dashboard_user
  before_filter :require_login
  before_filter :require_equal_user
  
  def show
  end

end
