class Song < ActiveRecord::Base
  validates :song_title, presence: true
  validates :url, format: { with: /(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+/, message: "Only youtube links please."}
  belongs_to :user
end 