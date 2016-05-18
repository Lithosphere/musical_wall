
class User < ActiveRecord::Base

  validates :username, presence: true
  validates :password, presence: true
  has_many :songs
  has_many :upvotes
end 
