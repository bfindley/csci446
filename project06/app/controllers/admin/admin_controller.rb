class Admin::AdminController < ApplicationController
  layout "admin"
  filter_access_to :all
  
  def index
    @games = Game.display_my_games(params[:page],current_user.id)
  end
  
  protected
  def permission_denied
    flash[:error] = "You do not have access to #{request.path}."
    redirect_to admin_root_url
  end
end