class Request < ActiveRecord::Base

 	belongs_to :user

	validates :target_id, presence: true
	validates :user_id, presence: true
	validate  :seen
	validate  :accept





end