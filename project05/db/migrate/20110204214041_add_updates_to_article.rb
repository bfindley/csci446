class AddUpdatesToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :updates, :integer, :default => 0
  end

  def self.down
    remove_column :articles, :updates
  end
end
