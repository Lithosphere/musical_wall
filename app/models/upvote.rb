
class Upvote < ActiveRecord::Base


  belongs_to :user
  belongs_to :song
  # validate :verify_upvoted?
  after_save :update_upvote_total

  def update_upvote_total
    song.upvotes += 1
    song.save
  end

  # def verify_upvoted?
  #   a = user.upvotes.where(user_id: user.id).where(song_id: song.id)
  #   a.each do |upvote|
  #     if upvote.upvoted? == true
  #       errors.add(:upvoted?, "you already upvoted this!")
  #     end
  #   end
  # end
end 
