class SessionsController < ApplicationController
  def new
    
  end
  def create
    authenticate_with_open_id do |result, identity_url|
      if result.successful?
        self.current_user = User.find_or_create_by_identity_url(identity_url)
        flash[:notice] = "You have been successfully logged in."
        redirect_to dashboard_path(current_user)
      else
        flash[:error] = result.message
        redirect_to(new_session_url)
      end
    end
  end

  def destroy
    self.current_user = nil
    reset_session
    redirect_to root_path
  end
end
