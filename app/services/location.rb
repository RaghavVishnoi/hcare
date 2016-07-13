class Location

	def self.search_nearby(params,id)
		Trainer.near([params[:latitude], params[:longitude]],radius(params[:radius]), units: :km)
	end

	def self.radius(radius)
		if radius != nil
			radius
		else
			RADIUS
		end
	end

end