class User < ActiveRecord::Base

  belongs_to :role, :counter_cache => true
  has_many :games
  
  attr_accessible :username, :email, :password, :first_name, :last_name, 
                  :password_confirmation, :last_login_at, :role_id, :photo, :id,
                  :games_count
   
  validates_length_of :username, :minimum => 6
  validates_presence_of :first_name, :last_name, :email

  has_attached_file :photo, :default_url => "/images/default_user.png", :url => "/assests/:class/:attachment/:id/:style/:filename"
  
  acts_as_authentic do |c|
    c.merge_validates_length_of_password_field_options({:minimum => 6})
  end
  
  @@per_page = 5
  
  def self.display_users(page)
    paginate(:per_page => @@per_page, :page => page, :order => "last_name")
  end

  def role_symbols
    return [role.name.to_sym]
  end
  
  def self.create_from_seed(account)
    @user = User.new(account)
    @user.save 
  end
    
  def get_full_name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def self.update_counter(old_user, new_user)
    if(old_user!=new_user)
      decrement_counter(:games_count, old_user)
      increment_counter(:games_count, new_user)
    end
  end
end
