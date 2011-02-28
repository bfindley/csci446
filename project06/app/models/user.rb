class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :first_name, :last_name, :password_confirmation
  acts_as_authentic do |c|
    c.merge_validates_length_of_password_field_options({:minimum => 6})
  end

  validates_length_of :username, :minimum => 6
  validates_presence_of :first_name, :last_name, :email
end
