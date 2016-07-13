class Api::V1::CentersController < Api::V1::ApisController

	set_pagination_headers :centers, only: [:index] 

	def index
		page = {}
        page[:page] = params[:page]
		@centers = Center.where('status = ? AND user_id != ?',ACTIVE,current_user.id).paginate(page).per_page(10) 
		render :index
	end

	def create
		if is_exists?(current_user.id)
			render :json => {result: t('Center.registration.exists')}
		else
			@center = Center.new(center_params.
								merge(user_id: current_user.id)
							)
			if @center.save!
				render :create
			else
				render_errors @center.errors.full_messages 
			end
		end		
	end

	def show
		@center = find_center
		if @center != nil
			render :show
		else
			render :json => {result: true,status: NOT_FOUND_CODE,messages: 'No center found!'}
		end
	end

	def like
		@centerLike = CenterLike.find_by(user_id: current_user.id,center_id: params[:id])
		if @centerLike != nil
			if @centerLike.status == true
				@centerLike.update(status: false)
			else
				@centerLike.update(status: true)
			end		
		else
			@centerLike = CenterLike.create!(user_id: current_user.id,center_id: params[:id],status: true)
		end
		render :like
	end	

	def likes
		likeCount = CenterLike.likeDetails(params[:id])
		render :json => {result: true,status: FETCH_SUCCESS_CODE,object: likeCount}
	end

	def rating
		@centerRating = CenterReview.find_by(center_id: params[:id],user_id: current_user.id)
		if @centerRating != nil
			@centerRating.update(rating: params[:center_review][:rating],review: params[:center_review][:review])
		else
			@centerRating = CenterReview.create!(center_id: params[:id],user_id: current_user.id,rating: params[:center_review][:rating],review: params[:center_review][:review])
		end
		render :rating
	end

	def ratings
		@centerRatings = CenterReview.reviews(params[:id])
		render :json => {result: true,status: FETCH_SUCCESS_CODE,object: @centerRatings}
	end

	private
		def center_params
			params.require(:center).permit(:email,:contact_number,:website,:address,:registration_number,
    	 								:registered_by,:owner_name,:owner_contact_number,:owner_address,:owner_email,
    	 								:contact_person,:contact_person_contact_number,:contact_person_address,:working_hours,
    	 								:started_in,:awards_and_achievements,:category_id,:mfrom,:mto,:efrom,:eto)
		end

		def is_exists?(user_id)
			Trainer.exists?(user_id: user_id) || Center.exists?(user_id: user_id)
		end

		def find_center
			Center.find_by(id: params[:id],status: 'Active')
		end

end