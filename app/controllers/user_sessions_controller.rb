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
        if session[:return_to].nil?
          redirect_to dashboard_path(current_user)
        else
          redirect_to session[:return_to]
        end
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
    session[:return_to] = nil
    redirect_to root_path
  end
end
