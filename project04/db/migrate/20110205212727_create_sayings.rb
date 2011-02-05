class CreateSayings < ActiveRecord::Migration
  def self.up
    create_table :sayings do |t|
      t.string :quote

      t.timestamps
    end
  end

  def self.down
    drop_table :sayings
  end
end
