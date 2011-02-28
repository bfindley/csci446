class UserSessionsController < ApplicationController
  def index
    @user_sessions = UserSession.all
  end

  def show
    @user_session = UserSession.find(params[:id])
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user_session = UserSession.find(params[:id])
  end

  def update
    @user_session = UserSession.find(params[:id])
    if @user_session.update_attributes(params[:user_session])
      flash[:notice] = "Successfully updated user session."
      redirect_to @user_session
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
