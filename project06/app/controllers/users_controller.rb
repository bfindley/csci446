class UsersController < ApplicationController
  filter_resource_access

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha() and @user.save 
      flash[:notice] = "Welcome #{@user.first_name} #{@user.last_name}."
      redirect_to root_url
    else
      flash[:notice] = "Sorry, could not register you."
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = "Successfully removed account"
    redirect_to root_url
  end
end
