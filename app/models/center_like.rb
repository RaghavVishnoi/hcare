class CenterLike < ActiveRecord::Base

	belongs_to :center
	belongs_to :user

	before_create :default_values

	validates :center_id, presence: true
	validates :user_id, presence: true
	validate  :status

	def self.likeCount(centerId)
		where(center_id: centerId,status: true).count
	end

	def self.likeDetails(centerId)
		details = []
		where(center_id: centerId,status: true).each do |likeDetail|
			detail = {}
			user = likeDetail.user
			detail[:username] = user.first_name+" "+user.last_name
			detail[:photo_url] = user.photo_url
			detail[:created_at] = likeDetail.updated_at.strftime("%d %b,%Y")
			details.push(detail)
		end
		details
	end

	private
		def default_values
			self.status ||= true
		end

end