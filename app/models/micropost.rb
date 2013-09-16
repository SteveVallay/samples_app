class Micropost < ActiveRecord::Base
  attr_accessible :user_id, :content
  validates :user_id , presence: true
end
