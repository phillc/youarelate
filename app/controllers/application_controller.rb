# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :current_user

    def current_user
      begin
        @current_user ||= session[:user] && User.find(session[:user])
      rescue ActiveRecord::RecordNotFound
        @current_user = nil
      end
    end

    def current_user=(user)
      @current_user = user
      session[:user] = user.is_a?(User) ? user.id : nil
    end

    def require_login
      restrict_access unless current_user.is_a?(User)
    end

    def restrict_access
      flash[:error] = "You have to log in or create a user before you do that!"
      redirect_to login_path
    end

    # current_user is the logged in user
    # @user is the user in the resource
    # these are for help in the dashboard
    def require_equal_user
      if @user.id != current_user.id
        render :file => "#{Rails.public_path}/401.html", :layout => true, :status => :unauthorized
      end
    end
    
    def resource_user
      @user = User.find(params[:dashboard_id])
    end

    def dashboard_user
      ##because the dashboard is the only place the dashboard_id is actually
      ##just id, but i still need it as a before_filter
      @user = User.find(params[:id])
    end
end
