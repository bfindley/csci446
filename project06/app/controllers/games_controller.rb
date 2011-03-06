class GamesController < ApplicationController
  layout "public"
  filter_resource_access
  def index
	  @games = Game.display_games(params[:page])
  end
  
  def create
    @user.save 
  end
  
end