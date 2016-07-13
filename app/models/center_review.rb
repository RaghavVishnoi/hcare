class CenterReview < ActiveRecord::Base

	belongs_to :center
	belongs_to :user

	validates :user_id, presence: true
	validates :center_id, presence: true
	validates :rating, presence: true
	validate  :review

	def self.reviews(centerId)
		reviews = []
		where(center_id: centerId).each do |review|
			rvw = {}
			user = review.user
			rvw[:username] = user.first_name+" "+user.last_name
			rvw[:photo_url] = user.photo_url
			rvw[:rating] = review.rating
			rvw[:review] = review.review
			reviews.push(rvw)
		end
		reviews
	end

	def self.total_rating(centerId)
		@reviews = find_center_rating(centerId)
		total_reviews = @reviews.count
		if total_reviews != 0
			rating_sum = @reviews.sum(:rating).to_f
			rating = rating_sum/total_reviews
			rating
		else
			5
		end
	end

	def self.find_center_rating(centerId)
		CenterReview.where(center_id: centerId)
	end

end