class UsersController < ApplicationController

  before_filter :require_user, :except => [:new, :create]

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful."
      redirect_to dashboard_path(@user)
    else
      render :action => "new"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile Updated"
      redirect_to root_url
    else
      render :action => "edit"
    end
  end
end
