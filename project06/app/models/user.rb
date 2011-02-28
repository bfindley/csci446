class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :first_name, :last_name
  acts_as_authentic
end
