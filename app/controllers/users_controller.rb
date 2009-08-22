class UsersController < ApplicationController

  before_filter :require_user, :except => [:new, :create]

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    @user.save do |result|
      if result
        flash[:notice] = "Registration Successful."
        redirect_to dashboard_path(@user)
      else
        render :action => "new"
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        flash[:notice] = "Profile Updated"
        redirect_to root_url
      else
        render :action => "edit"
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
