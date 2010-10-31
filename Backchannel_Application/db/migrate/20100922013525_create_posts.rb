class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :content
      t.date :posted_at
      t.integer :grade

      t.references :users
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
