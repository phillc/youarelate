class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to dashboard_path(current_user)
    end
  end
end
