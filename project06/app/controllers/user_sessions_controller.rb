class UserSessionsController < ApplicationController
  filter_resource_access
  layout "public"
  def new
    @user_session = UserSession.new
  end

  def create
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      @user = User.find_by_username(params["user_session"]["username"])
      if(@user.role.name == "admin")
        redirect_to admin_root_url
      elsif(@user.role.name == "member")
        redirect_to member_root_url
      end
    else
      flash[:error] = "Failed to log in."
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
  

end
