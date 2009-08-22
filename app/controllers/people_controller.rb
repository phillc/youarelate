class PeopleController < ApplicationController
  before_filter :get_user

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
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])
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
      flash[:notice] = 'Person was successfully updated.'
      redirect_to(@person)
    else
      render :action => "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to(people_url)
  end

  private
    def get_user
      @user = User.find(params[:dashboard_id])
    end
end
