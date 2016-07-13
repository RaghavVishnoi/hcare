class Api::V1::TrainerLikesController < Api::V1::ApisController

	def create
		user = User.get_user(token)
		if like_exists
			@trainer_like = TrainerLike.find_by(trainer_id: trainer_like_params[:trainer_id],user_id: user.id)
			@trainer_like.destroy
			render :json => {result: false}
		else
			@trainer_like = TrainerLike.new(trainer_like_params.
										merge(user_id: user.id)
									)
			if @trainer_like.save
				render :json => {result: true}
			else
				render_errors @trainer_like.errors.full_messages
			end
	    end
	end

	def show
		@trainer_like = TrainerLike.likes(params[:trainer_id])
		render :json => {result: true, object: @trainer_like}
	end

	def trainer_like_params
		params.require(:trainer_like).permit(:trainer_id)
	end

	def like_exists
		TrainerLike.exists?(trainer_id: trainer_like_params[:trainer_id],user_id: User.get_user(token).id)
	end

end