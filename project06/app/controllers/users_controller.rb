class UsersController < ApplicationController
  filter_resource_access

  def new
    @user = User.new(params["user"])
  end

  def create
    if verify_recaptcha() 
      if @user.save 
        redirect_to member_root_url, :notice => "Welcome #{@user.first_name} #{@user.last_name}."
      else
        render :action => "new"
      end
    else
      flash[:error] = "You typed in the wrong verification code."
      render :action => "new"
    end
  end
end
