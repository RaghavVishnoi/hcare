class Api::V1::RequestsController < Api::V1::ApisController

	def create
		if is_exists?
			render :json => {result: false,status: CREATE_SUCCESS_CODE,messages: "Already requested!"}
		else
			@request = Request.new(target_id: find_target_user.id,user_id: current_user.id,seen: false,accept: false)					
			if @request.save!
				render :create
			else
				render_errors @request.errors.full_messages
			end
		end
	end	

	def show
		@request = find_request
		render :json => {result: true, object: @request}
	end

	def find_request
		Request.find(params[:id])
	end

private
	def request_params
		params.require(:request).permit(:seen,:accept,:target_id,:user_id)
	end

	def find_target_user
		Trainer.find(params[:id]).user
	end

	def is_exists?
		Request.exists?(target_id: find_target_user,user_id: current_user.id)
	end

end