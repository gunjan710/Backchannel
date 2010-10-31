class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :replies, :class_name=>"Post"
  validates_presence_of :original_post
  validates_presence_of :reply
end
