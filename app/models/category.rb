class Category < ActiveRecord::Base

	has_many :centers
	has_many :trainers

end