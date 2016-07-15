class SessionsController < ApplicationController
 
	layout 'login'
	skip_before_filter :require_login, only: [:create, :new, :destroy], raise: false
	skip_before_filter :authorize, only: [:create, :new, :destroy], raise: false
	skip_before_action :authenticate_user, :except => [:destroy]
	
	def create
		@user = authenticate(params)
 		sign_in(@user) do |status|
 			 
 			if  @user.roles.first.name=='user' &&  status.success?  && @user!= nil
  				redirect_to new_view_pager_path 		 	
			else
				render :new 
			end
		end
	end

	def destroy
 		sign_out
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { render :json => { :result => false, :message => 'Successfully logged out'} }
	    end
	end

end
