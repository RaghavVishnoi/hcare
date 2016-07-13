class PasswordGenerator

	def self.password
		SecureRandom.hex(5)
	end

end