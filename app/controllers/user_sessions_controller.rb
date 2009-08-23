class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
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
        @user.save do |result2|
            puts "+_++++++++++++++"
            puts 'thsi is where we are'
            puts result2
            puts @user.errors.inspect
          if result2
            flash[:notice] = "Registration Successful."
            redirect_to dashboard_path(@user)
          else
            render :action => "new"
          end
        end
      end
    end

    #lol hacks!!
    ## this is for user session, if you feed it an open id provider
    #that 404s, then it does some crazy break out of block thing
    #(i know because i read the source code), and somehow, we end up
    #at this part of the create method without ever rendering
    #something... and so uh, if we havent rendered or redirected... lets
    #assume that something messed up and hit them back to the form
    #if !@performed_render and !@performed_redirect
      #render :action => "new"
    #end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    session[:return_to] = nil
    redirect_to root_path
  end
end
