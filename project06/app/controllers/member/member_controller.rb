class Member::MemberController < ApplicationController
  filter_access_to :all
  
  def index
  
  end
  
  protected
  def permission_denied
    flash[:error] = "You do not have access to #{request.path}."
    redirect_to member_root_url
  end
end