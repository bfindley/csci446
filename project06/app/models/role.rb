class Role < ActiveRecord::Base
  has_many :users
  attr_accessible :name
  
  def self.update_counter(old_role, new_role)
    if(old_role!=new_role)
      decrement_counter(:users_count, old_role)
      increment_counter(:users_count, new_role)
    end
  end
end
