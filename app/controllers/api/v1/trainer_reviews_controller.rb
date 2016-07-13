class Api::V1::TrainerReviewsController < Api::V1::ApisController

	def create
		@trainer_review = TrainerReview.new(trainer_review_params.
								merge(user_id: User.get_user(token).id)
							)
		if @trainer_review.save
			render :json => {result: true, object: @trainer_review}
		else
			render_errors @trainer_review.errors.full_messages
		end
	end

	def show
		@trainer_reviews = TrainerReview.reviews(params[:trainer_id])
		render :json => {result: true, object: @trainer_reviews}
	end

	def trainer_review_params
		params.require(:trainer_review).permit(:trainer_id,:rating,:review)
	end

end