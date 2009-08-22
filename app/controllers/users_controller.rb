class UsersController < ApplicationController

  before_filter :require_user, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])
    #@user.save do |result|
      #if result
        #flash[:notice] = "Registration Successful."
        #redirect_to dashboard_path(@user)
      #else
        #render :action => "new"
      #end
    #end
  end


#  def update
#    @user = current_user
#    @user.attributes = params[:user]
#
#    @user.save do |result|
#      if result
#        flash[:notice] = "Profile Updated"
#        redirect_to root_url
#      else
#        render :action => "edit"
#      end
#    end
#
#  end

  #TODO: Remove below
  #  def edit
  #    @user = current_user
  #  end
  #  def update
  #    @user = current_user
  #    @user.attributes = params[:user]
  #
  #    @user.save do |result|
  #      if result
  #        flash[:notice] = "Profile Updated"
  #        redirect_to root_url
  #      else
  #        render :action => "edit"
  #      end
  #    end
  #
  #  end


end
