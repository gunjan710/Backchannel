class Post < ActiveRecord::Base
   belongs_to :user
   has_many :comments
   has_many :replies, :through=> :comments
   validates_presence_of :content
   validates_presence_of :users_id
end
