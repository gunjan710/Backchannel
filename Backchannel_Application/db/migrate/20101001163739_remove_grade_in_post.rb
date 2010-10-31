class RemoveGradeInPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :grade        
  end

  def self.down
    add_column :posts, :grade, :integer
  end
end
