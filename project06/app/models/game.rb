class Game < ActiveRecord::Base

  belongs_to :user, :counter_cache => true
  attr_accessible :title, :rating, :user_id

  validates_presence_of :title
  
  @@per_page = 10
  @@ratings=[ "Amazing", "Good", "Meh.", "Horrible" ]

  def self.display_games(page)
    paginate(:per_page => @@per_page, :page=> page, :order => "games.created_at DESC" )
  end
  
  def self.display_my_games(page, user)
    paginate_by_user_id(user, :per_page => @@per_page, :page=> page, :order => "games.created_at DESC" )
  end
  
  def get_rating
    return @@ratings[self.rating]
  end

  def get_creator(id2)
    if self.user_id == id2
      return "me"
    else
      return self.user.get_full_name
    end
  end
end
