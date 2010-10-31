class User < ActiveRecord::Base
  has_many :post
  has_many :cheer
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_confirmation_of :password

   # Checks login information
  def self.authenticate(username, password)
    user = find(:first, :conditions => ['username = ?',username])
    if user == nil
      return false
    end
    if password.eql?(nil)
      return false
    end
    if password.eql?(user.password)
      return user
    else
      return false
    end
  end  
end
