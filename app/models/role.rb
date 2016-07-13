class Role < ActiveRecord::Base

    has_many :associated_roles, :dependent => :destroy
	validates :name, presence: true

end