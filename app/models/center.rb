class Center < ActiveRecord::Base

		 belongs_to :user
		 belongs_to :category

		 before_save :default_values

	     validates :email,presence: true
    	 validates :contact_number,presence: true
    	 validate :website
    	 validates :address,presence: true
    	 validates :registration_number,presence: true
    	 validates :registered_by,presence: true
    	 validates :owner_name,presence: true
    	 validate :owner_contact_number
    	 validate :owner_address
    	 validate :owner_email
    	 validates :contact_person,presence: true
    	 validates :contact_person_contact_number,presence: true
    	 validates :contact_person_address,presence: true
    	 validates :working_hours,presence: true
    	 validates :started_in,presence: true
    	 validate :awards_and_achievements
    	 validates :category_id,presence: true
    	 validates :mfrom,presence: true
    	 validates :mto,presence: true
    	 validates :efrom,presence: true
    	 validates :eto,presence: true
    	 validate :status


    private
    	def default_values
    		self.status ||= 'Active'
    	end

end