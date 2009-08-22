class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    puts params.inspect
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
      if result
        flash[:notice] = "Successfully logged in."
        redirect_to dashboard_path(current_user)
      else
        @user = User.new(:openid_identifier => params["openid.claimed_id"])
        @user.save do |result|
          if result
            flash[:notice] = "Registration Successful."
            redirect_to dashboard_path(@user)
          else
            render :action => "new"
          end
        end
      end
    end

  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_url
  end
end
