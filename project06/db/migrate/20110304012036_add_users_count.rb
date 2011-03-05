class AddUsersCount < ActiveRecord::Migration
  def self.up
    add_column :roles, :users_count, :integer, :default => 0
    
    Role.reset_column_information
    Role.all.each do |r|  
      Role.update_counters r.id, :users_count => r.users.length
    end
  end

  def self.down
    remove_column :roles, :users_count
  end
end
