class HomeWorkout < ActiveRecord::Base

	mount_uploader :home_workout, HomeWorkoutUploader
	before_save :default_values

	validates :home_workout, presence: true
	validate  :photo_url 
	validate  :status
	validates :title, presence: true


	private
		def default_values
			self.status ||= 'Active'
		end

end