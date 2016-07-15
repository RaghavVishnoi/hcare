class Api::V1::UsersController < Clearance::BaseController

	skip_before_filter :require_login, only: [:create, :new], raise: false
	skip_before_action :authenticate_user, only: [:create, :new], raise: false
	
	

	def create		
		@user = user_from_params
		if @user.save
			render :create
		else
			render_errors @user.errors.full_messages
		end		
	end

	def facebook_auth
		@user  = User.new extra_facebook_information
		puts "ssssssss#{@user.to_json}"
		@user_exists = User.exists?(facebook_user_id: @user.facebook_user_id)
		if @user_exists
			User.find_by(facebook_user_id: @user.facebook_user_id).update(facebook_user_token: @user.facebook_user_token)
			render :json => {result: true,status: 200,messages: 'Already verified!'}
		else
			if @user.save
 			    render :create
			else
				render_errors @user.errors.full_messages
			end
		end
	end

	def google_auth
		data = Response.googleAuth(params[:access_token])
		render :json => {result: true,object: data}
	end

	private

		def user_from_params
			email = user_params.delete(:email)
			password = user_params.delete(:password)
			Clearance.configuration.user_model.new(user_params).tap do |user|
				user.email = email
				user.password = password
			end
		end

		def user_params
			params.require(:user).permit(
				:first_name,
				:last_name,
				:email,
				:contact_number,
				:gender,
				:password,
				:role_ids
			)
		end

		def extra_facebook_information
		    {
		      first_name: facebook_client.first_name,
		      last_name: facebook_client.last_name,
		      email: facebook_client.email,
		      facebook_user_id: facebook_client.user_id,
		      facebook_user_token: facebook_user_token,
		      gender: facebook_client.gender,
		      photo_url: ProfilePictureFinder.find_profile_picture(facebook_client.user_id)
		    }
		end

	    def facebook_client
	        @facebook_client ||= FacebookAuthentication.new(facebook_user_token)
	    end

	    def facebook_user_token
	        params[:user][:facebook_user_token]
	    end

	    def password_generator
	    	PasswordGenerator.password
	    end

end