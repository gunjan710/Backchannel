class Cheer < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :posts_id
  validates_presence_of :users_id
end
