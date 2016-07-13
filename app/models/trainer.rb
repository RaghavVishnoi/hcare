class Trainer < ActiveRecord::Base
      attr_reader :full_address

	  # or with a method
	  geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example

	  # the callback to set longitude and latitude
	  after_validation :geocode

	before_save :default_values
	after_save  :update_role

	belongs_to :category
	belongs_to :sector
	belongs_to :user

	validates :name, presence: true
	validates :personal_contact_number, presence: true
	validate  :alternate_contact_number
	validates :gender, presence: true
	validates :email, presence: true, uniqueness: true
	validate  :bio
	validate  :awards_and_certificates
	validates :category_id, presence: true
	validates :address, presence: true
	validates :state, presence: true
	validates :city, presence: true
	validates :zip_code, presence: true
	validate  :latitude
	validate  :longitude
	validate  :status
	validates :user_id, presence: true
	validate  :profile_picture



	def self.search_nearby(params,id)
		ids = []
		current_id = current(id).id
		data.each do |trainers|
			ids.push(trainers[:id])
		end
		ids.delete(current_id)
		trainers_info(ids,id)
	end

	def self.trainers_info(ids,current_id)
		@current_id = current_id
		trainers = []
		ids.each do |id|
			trainers.push(trainer_info(id))
		end
		trainers
	end

	# def self.trainer_info(id)
	# 	@id = id
	# 	trainer = {}
	# 	@trainer = Trainer.find(id)
	# 	trainer = @trainer.attributes
	# 	trainer[:category_name] = Category.find(@trainer.category_id).name
	# 	trainer[:rating] = total_rating
	# 	trainer[:likes] = likes
	# 	trainer[:is_requested] = is_requested?(@trainer['user_id'],@current_id)
	# 	trainer[:is_accepted] = is_accepted?(@trainer['user_id'],@current_id)
	# 	trainer
	# end

	

	

	def self.current(user_id)
		Trainer.find_by(user_id: user_id)
	end

	def self.trainer_detail(id)
		@id = id
		@trainer = trainer_info(id)
		@trainer[:total_rating] = total_rating
		@trainer[:reviews] = reviews
		@trainer
	end

	def self.total_rating(trainerId)
		@reviews = find_trainer_rating(trainerId)
		total_reviews = @reviews.count
		if total_reviews != 0
			rating_sum = @reviews.sum(:rating).to_f
			rating = rating_sum/total_reviews
			rating
		else
			5
		end
	end

	def self.is_requested?(target_id,user_id)
		Request.exists?(target_id: target_id,user_id: user_id)
	end

	def self.is_accepted?(target_id,user_id)
		Request.exists?(target_id: target_id,user_id: user_id,accept: true)
	end

	def self.likes(trainerId)
		TrainerLike.where(trainer_id: trainerId,status: true).count
	end

	def self.reviews
		reviews = []
		@reviews.each do |review|
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

	def self.find_trainer_rating(trainerId)
		TrainerReview.where(trainer_id: trainerId)
	end

	private
		def default_values
			self.status ||= ACTIVE
		end

		def update_role
			User.find(self.user_id).update(role_ids: 3)
		end

  



	

end