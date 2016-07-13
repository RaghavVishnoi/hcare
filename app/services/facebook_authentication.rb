class FacebookAuthentication

	def initialize(facebook_user_token)
		@client = Koala::Facebook::API.new(facebook_user_token)
	end

	def user_id
	    basic_information["id"]
	end

	def birthday
	    if basic_information["birthday"].present?
	      Date.strptime(basic_information["birthday"], "%m/%d/%Y")
	    else
	      ""
	    end
	end

	def first_name
	    basic_information["first_name"]
	end

	def last_name
	    basic_information["last_name"]
	end

	def email
	    basic_information["email"]
	end

	def gender
	    if basic_information["gender"].present?
	      basic_information["gender"]
	    else
	      "notspecified"
	    end
	end

	private
	  attr_reader :client

	  def basic_information
	    @basic_information ||= client.get_object("me")
	  end
end