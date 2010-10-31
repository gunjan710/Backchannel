class RemovePostedAtColumn < ActiveRecord::Migration
  def self.up
    remove_column :posts, :posted_at
  end

  def self.down
    add_column :posts, :posted_at, :date
  end
end
