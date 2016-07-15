class FirstAidsController < ApplicationController

	skip_before_filter :user_authenticate

	def index
		pagination = Pager.pagination(params[:page])
		next_id = pagination[1]+1
		@first_aid_symptoms = FirstAid.where(status: ACTIVE,id: pagination[0]..pagination[1]).pluck(:symptoms)
		@first_aids = FirstAid.first_aid_data(@first_aid_symptoms)
		render :json => {result: true,object: @first_aids,:has_next => has_next(next_id)}
	end

	def new
		@first_aid = FirstAid.new
	end

	def create
		@first_aid = FirstAid.new(first_aid_params)
		 
		if @first_aid != nil
			Treatment.create!(treatment: params[:first_aid][:prerequisites] , first_aid_id: params[:first_aid][:symptoms].to_i )
			#FirstAid.treatments(params[:first_aid][:treatments],@first_aid.id)
			respond_to do |format|
			      format.html { redirect_to new_first_aid_path }
			      format.json { render result: true,object: @first_aid}
			   end
			#render :json => {result: true,object: @first_aid}
		else
			render_errors @first_aid.errors.full_messages
		end
	end

	def show
		@first_aid = FirstAid.first_aid_detail(params[:id])
		render :json => {result: true,object: @first_aid}
	end

	def update
		@first_aid = FirstAid.find(params[:id]).update_attributes(first_aid_params)
		render :json => {result: true, object: @first_aid}
	end

	def first_aid_params
		params.require(:first_aid).permit( :prerequisites,:symptoms )
	end

	def has_next(id)
		FirstAid.exists?(id: id)
	end

end