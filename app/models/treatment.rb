class Treatment < ActiveRecord::Base

	belongs_to :first_aid

	validates :treatment, presence: true

end