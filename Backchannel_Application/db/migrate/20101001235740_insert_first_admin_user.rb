class InsertFirstAdminUser < ActiveRecord::Migration
  def self.up
    user = User.new
    user.id = 1
    user.username = "admin"
    user.password = "admin"
    user.name = "Admin"
    user.grade = 0
    user.admin = true
    user.save
  end

  def self.down
    user = User.find(1)
    user.destroy
  end
end
