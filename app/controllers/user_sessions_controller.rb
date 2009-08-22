class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    puts '---------------'
    puts params.inspect
    @user_session.save do |result|
      puts '++++++++++++++++++'
      puts result
      puts '---------------'
      puts params.inspect
      if result
        flash[:notice] = "Successfully logged in."
        redirect_to dashboard_path(current_user)
      else
        @user = User.new(params[:user_session])
        @user.save do |result|
          if result
            flash[:notice] = "Registration Successful."
            redirect_to dashboard_path(@user)
          else
            puts '---------------'
            puts params[:user_session]
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
