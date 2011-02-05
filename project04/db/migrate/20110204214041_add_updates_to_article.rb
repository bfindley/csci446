class AddUpdatesToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :updates, :integer
  end

  def self.down
    remove_column :articles, :updates
  end
end
