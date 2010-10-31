class CreateCheers < ActiveRecord::Migration
  def self.up
    create_table :cheers do |t|
      t.references :users
      t.references :posts
      
      t.timestamps
    end
  end

  def self.down
    drop_table :cheers
  end
end
