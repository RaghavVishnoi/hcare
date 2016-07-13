class Pager

	def self.pagination(page_number)
		pagination = []
		start_index = (page_number.to_i*PER_PAGE.to_i+1)-PER_PAGE.to_i
		pagination.push(start_index)
		last_index = start_index+PER_PAGE.to_i-1
		pagination.push(last_index)
		pagination
	end

end