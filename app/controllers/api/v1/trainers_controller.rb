class Api::V1::TrainersController < Api::V1::ApisController

	set_pagination_headers :trainers, only: [:index,:search] 


	def index
		page = {}
        page[:page] = params[:page]
		@trainers = Trainer.where('status = ? AND user_id != ?',ACTIVE,current_user.id).paginate(page).per_page(10) 
		render :index
	end

	def create
		user_id = current_user.id
		if is_exists?(user_id)
			render :json => {result: t('Trainer.registration.exists')}
		else
			@trainer = Trainer.new(trainer_params.
								merge(user_id: user_id)
							)
			if @trainer.save
				render :create
			else
				render_errors @trainer.errors.full_messages
			end
		end
	end

	def show
		@trainer = find_trainer
		if @trainer != nil
			render :show
		else
			render :json => {result: true,status: NOT_FOUND_CODE,messages: 'No trainer found!'}
		end
	end

	def search
		page = {}
        page[:page] = params[:page]
		if params[:radius] != 0
			@trainers = Location.search_nearby(params,current_user.id).where('status = ? AND user_id != ? AND category_id = ?',ACTIVE,current_user.id,params[:category_id]).paginate(page).per_page(10)
		else
			@trainers = Trainer.where('status = ? AND user_id != ?',ACTIVE,current_user.id).paginate(page).per_page(10) 
		end
		render :search
	end

	def like
		@trainerLike = TrainerLike.find_by(user_id: current_user.id,trainer_id: params[:id])
		if @trainerLike != nil
			if @trainerLike.status == true
				@trainerLike.update(status: false)
			else
				@trainerLike.update(status: true)
			end		
		else
			@trainerLike = TrainerLike.create!(user_id: current_user.id,trainer_id: params[:id],status: true)
		end
		render :like	
	end

	def likes
		likeCount = Trainer.likes(params[:id])
		render :json => {result: true,status: FETCH_SUCCESS_CODE,object: likeCount}
	end

	def rating
		@trainerRating = TrainerReview.find_by(trainer_id: params[:id],user_id: current_user.id)
		if @trainerRating != nil
			@trainerRating.update(rating: params[:trainer_review][:rating],review: params[:trainer_review][:review])
		else
			@trainerRating = TrainerReview.create!(trainer_id: params[:id],user_id: current_user.id,rating: params[:trainer_review][:rating],review: params[:trainer_review][:review])
		end
		render :rating
	end

	def ratings
		@trainerRatings = TrainerReview.reviews(params[:id])
		render :json => {result: true,status: FETCH_SUCCESS_CODE,object: @trainerRatings}
	end

	def trainer_params
		params.require(:trainer).permit(:name,:personal_contact_number,:alternate_contact_number,:gender,:email,:bio,:state,:city,:zip_code,:awards_and_certificates,:category_id,:address,:latitude,:longitude)
	end

	def find_trainer
		Trainer.find(params[:id],status: 'Active')
	end

	def lat
		params[:latitude]
	end 

	def long
		params[:longitude]
	end

	def is_exists?(user_id)
		Trainer.exists?(user_id: user_id) || Center.exists?(user_id: user_id)
	end

end