class Api::V1::MessagesController < Api::V1::ApisController


	def create
		@message = Message.new(message_param.
						merge(user_id: current_user.id)
					)
		if @message.save
			render :create
		else
			render_errors @message.errors.full_messages
		end
	end

	def message_param
		params.require(:message).permit(:request_id,:content,:user_type,:message_type)
	end

end