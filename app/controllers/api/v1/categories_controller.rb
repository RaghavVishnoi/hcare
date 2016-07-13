class Api::V1::CategoriesController < Api::V1::ApisController
	skip_before_action :user_authenticate
    skip_before_filter  :verify_authenticity_token

	def index
		@categories = Category.all
		render :json => {result: true,object: @categories}
	end

end