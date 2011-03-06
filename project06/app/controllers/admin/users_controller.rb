class Admin::UsersController < Admin::AdminController
  layout "admin"
  filter_resource_access

  def index
    @users = User.display_users(params[:page])
  end

  def show
  end
  
  def edit
  end

  def update
    @last_role = @user.role_id
    if @user.update_attributes(params[:user])
      Role.update_counter(@last_role, @user.role_id)
      redirect_to admin_users_url, :notice => "Successfully updated profile."
    else
      flash[:error] = "Failed to update profile."
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed account"
    redirect_to admin_users_url
  end
  
end
