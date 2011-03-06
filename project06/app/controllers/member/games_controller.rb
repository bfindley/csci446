class Member::GamesController < Member::MemberController
  layout "member"
  filter_resource_access
  def index
	  @games = Game.display_games(params[:page])
    @total_games = Game.count
  end
  
  def create
    @user.save 
  end
    
  def create
    @game.user_id=current_user.id
    if @game.save
      flash[:notice] = "Successfully added #{@game.title}."
      redirect_to member_games_path 
    else
      flash[:Error] = "Could not create game."
      render :action => 'new'
    end
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def update
    @last_user = @game.user_id
    if @game.update_attributes(params[:game])
      User.update_counter(@last_user, @game.user_id)
      flash[:notice] = "Successfully updated game."
      redirect_to member_games_path
    else
      flash[:Error] = "Failed to update game."
      render :action => 'edit'
    end
  end
  
end
