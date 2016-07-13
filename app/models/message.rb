class Message < ActiveRecord::Base

	belongs_to :user
	belongs_to :request

	validates :user_id, presence: true
	validates :request_id, presence: true
	validates :content, presence: true
	validates :user_type, presence: true
	validates :message_type, presence: true

end	