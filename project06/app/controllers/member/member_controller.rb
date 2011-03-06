class Member::MemberController < ApplicationController
  filter_access_to :all
  layout "member"
  def index
    @games = Game.display_my_games(params[:page],current_user.id)
  end
  
  protected
  def permission_denied
    flash[:error] = "You do not have access to #{request.path}."
    redirect_to member_root_url
  end
end