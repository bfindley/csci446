class Member::UsersController < Member::MemberController
  filter_resource_access
  def show
  end
  
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to member_root_url
    else
      flash[:error] = "Could not save profile."
      render :action => "edit"
    end
  end  
end
