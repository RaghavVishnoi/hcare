class TrainerLike < ActiveRecord::Base

	belongs_to :user
	belongs_to :trainer

	validates :user_id, presence: true
	validates :trainer_id, presence: true

	def self.likes(trainer_id)
		likes = []
		@trainer_likes = TrainerLike.where(trainer_id: trainer_id)
		@trainer_likes.each do |trainer_like|
			like = {}
			user = User.find(trainer_like.user_id)
			like[:first_name] = user.first_name
			like[:last_name] = user.last_name
			like[:email] = user.email
			like[:contact_number] = user.contact_number
			likes.push(like)
		end
		likes
	end

end