class SessionsController < ApplicationController
  def new
    
  end
  def create
    authenticate_with_open_id do |result, identity_url|
      if result.successful?
        if @current_user = User.find_by_identity_url(identity_url)
          session[:user_id] = @current_user.id
          redirect_to(root_url)
        else
          failed_login "Sorry, no user by that identity URL exists (#{identity_url})"
        end
      else
        failed_login result.message
      end
    end
  end

  private
    def failed_login(message)
      flash[:error] = message
      redirect_to(new_session_url)
    end
end
