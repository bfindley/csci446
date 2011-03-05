class UserSessionsController < ApplicationController
  filter_resource_access
  def index
    @user_sessions = UserSession.all
  end

  def show
  end

  def new
    @user_session = UserSession.new
  end

  def create
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      flash[:error] = "Failed to log in."
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @user_session.update_attributes(params[:user_session])
      flash[:notice] = "Successfully updated user session."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
  

end
