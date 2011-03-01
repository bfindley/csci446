class User < ActiveRecord::Base
  belongs_to :role 
  attr_accessible :username, :email, :password, :first_name, :last_name, :password_confirmation, :last_login_at, :role_id
  acts_as_authentic do |c|
    c.merge_validates_length_of_password_field_options({:minimum => 6})
  end

  validates_length_of :username, :minimum => 6
  validates_presence_of :first_name, :last_name, :email
  
  def role_symbols
    return [role.name.to_sym]
  end
  
  def self.create_from_seed(account)
    @user = User.new(account)
    @user.save 
  end
    
end
