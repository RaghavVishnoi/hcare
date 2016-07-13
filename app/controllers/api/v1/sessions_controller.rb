class Api::V1::SessionsController < Api::V1::ApisController

	before_filter :redirect_signed_in_users, only: [:new]
	skip_before_filter :require_login, only: [:create, :new, :destroy], raise: false
	skip_before_filter :authorize, only: [:create, :new, :destroy], raise: false
	skip_before_action :authenticate_user
	
	def create
		@user = authenticate(params)
		sign_in(@user) do |status|
			if status.success?
				@user = user(@user.remember_token)
				render :create
			else
				render_errors status.failure_message
			end
		end
	end

	def destroy
		sign_out
		render json: {result: true, messages: t('session.destroy.success.message')}
	end

	def user(token)
		User.find_by(remember_token: token)
	end
end