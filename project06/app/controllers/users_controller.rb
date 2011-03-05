class UsersController < ApplicationController
  filter_resource_access

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user.role_id=2
    if verify_recaptcha() and @user.save 
      flash[:notice] = "Welcome #{@user.first_name} #{@user.last_name}."
      redirect_to root_url
    else
      flash[:error] = "Sorry, could not register you."
      redirect_to :controller => "users", :action => 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed account"
    redirect_to root_url
  end
  
end
