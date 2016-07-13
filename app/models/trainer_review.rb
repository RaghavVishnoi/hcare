class TrainerReview < ActiveRecord::Base

	belongs_to :user
	belongs_to :trainer

	validates :user_id, presence: true
	validates :trainer_id, presence: true
	validates :rating, presence: true
	validate  :review

	def self.reviews(trainer_id)
		reviews = []
		@trainer_reviews = TrainerReview.where(trainer_id: trainer_id)
		@trainer_reviews.each do |trainer_review|
			review = {}
			user = User.find(trainer_review.user_id)
			review[:rating] = trainer_review.rating
			review[:review] = trainer_review.review
			review[:username] = user.first_name.to_s+" "+user.last_name.to_s
			review[:email] = user.email
			review[:contact_number] = user.contact_number
			reviews.push(review)
		end
		reviews
	end 

end