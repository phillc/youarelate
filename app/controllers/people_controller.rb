class PeopleController < ApplicationController
  before_filter :require_user, :get_user

  def index
    if params[:search] && params[:people]
      @people = @user.people.find(:all, :conditions => ['name LIKE ? AND id NOT IN (?)', "%#{params[:search]}%", params[:people]], :limit => 20)
    elsif params[:search]
      @people = @user.people.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"], :limit => 20)
    else
      @people = @user.people.all
    end
  end

  def show
    @person = @user.people.find(params[:id])
  end

  def new
    @person = @user.people.new
  end

  def edit
    @person = @user.people.find(params[:id])
  end

  def create
    @person = @user.people.new(params[:person])
    if @person.save
      flash[:notice] = 'Person was successfully created.'
      redirect_to(@person)
    else
      render :action => "new"
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = "#{@person.name} was successfully updated."
      redirect_to(dashboard_path(current_user))
    else
      render :action => "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.js { render :nothing => true }
    end
  end

  private
    def get_user
      @user = User.find(params[:dashboard_id])

      if @user != current_user
        redirect_to dashboard_path(current_user)
      end
    end
end
