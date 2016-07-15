class HomeWorkoutsController < ApplicationController
	#skip_before_action :authenticate_user

	def index
		@home_workouts = HomeWorkout.where(status: ACTIVE)
		render :json => {result: true,object: @home_workouts}
	end

	def new
		@home_workout = HomeWorkout.new
	end

	def create
		@home_workout = HomeWorkout.new home_workout_params
		if @home_workout.save
			url = HomeWorkoutSerializer.new(@home_workout, :root => false)
			full_url = BASE_URL+url.image_url
			HomeWorkout.where(id: @home_workout.id).update_all(photo_url: full_url)
			render :json => {result: true,object: full_url}
		else
			render_errors @home_workout.errors.full_messages
		end
	end

	def show
		@home_workout = HomeWorkout.find(params[:id])
		render :json => {result: true,object: @home_workout}
	end

	def update
		@home_workout = HomeWorkout.find(params[:id])
		home_workout  = @home_workout.update_attributes(home_workout_params)
		render :json => {result: true,object: home_workout}
	end

	def home_workout_params
		params.require(:home_workout).permit(:home_workout,:title,:description)	
	end

end