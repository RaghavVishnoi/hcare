class Api::V1::StatesController < Api::V1::ApisController
	skip_before_action :user_authenticate
    skip_before_filter  :verify_authenticity_token


	def index
		@states = State.all
		render :json => {result: true,object: @states}
	end

end