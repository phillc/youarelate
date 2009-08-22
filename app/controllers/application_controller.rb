# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :current_user, :resource_user

  private
  # current_user is the logged in user
  # @user is the user in the resource

    def require_user
      if !current_user
        session[:return_to] = request.request_uri
        flash[:notice] = "Sorry, you must be logged in to continue."
        redirect_to(login_path)
      end
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    # these are for help in the dashboard
    def require_equal_user
      if @user != current_user
        render :file => "#{Rails.public_path}/401.html", :layout => true, :status => :unauthorized
      end
    end

    def resource_user
      @user = User.find(params[:dashboard_id])
    end
    def dashboard_user
      #because the dashboard is the only place the dashboard_id is actually
      #just id, but i still need it as a before_filter
      @user = User.find(params[:id])
    end
end
