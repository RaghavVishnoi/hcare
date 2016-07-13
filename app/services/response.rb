class Response 

	def self.googleAuth(token)
		response = HTTParty.get("https://www.googleapis.com/oauth2/v2/userinfo",
		    headers: {
		    'Authorization' => "OAuth #{token}"
		    })
	end

end