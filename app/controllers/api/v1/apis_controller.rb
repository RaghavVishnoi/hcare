class Api::V1::ApisController < ApplicationController

 	before_action :authenticate_user
	helper_method :current_user

	private
		def authenticate_user
	      unless logged_in?
	        respond_to do |format|
	          format.html { redirect_to :sign_in, alert: 'You need to login' }
	          format.json { render :json => { :result => false,status: UNAUTHORIZE_ACCESS_CODE ,:message => "User not found!" } }
	        end
	      end
	    end

		def find_user(token)
	      if token != nil
	        @user = User.find_by(:remember_token => token)
	      elsif session[:user_id]
	        @user = User.find_by(:id => session[:user_id])
	        token_expiry @user
	      end
	      if @user != nil
	        token_expiry @user
	      end
	    end

	    def token_expiry user  
	      if user.token_expiry != nil
	        if user.token_expiry < Time.now
	          render :json => { :result => false,status: UNAUTHORIZE_ACCESS_CODE,:message => "Token Expire!" } 
	        else
	          user
	        end
	      else
	        user
	      end
	    end

	    def logged_in?
	      current_user
	    end

	    def current_user
	      if request.headers['Authorization'] != nil
	        authenticate_or_request_with_http_token do |token, _options|
	           find_user(token)
	        end
	      end
	    end


	protected
          def self.set_pagination_headers(name, options = {})
               after_filter(options) do |controller|
                results = instance_variable_get("@#{name}")
                headers["X-Pagination"] = {
                  total: results.total_entries,
                  total_pages: results.total_pages,
                  first_page: results.current_page == 1,
                  last_page: results.next_page.blank?,
                  previous_page: results.previous_page,
                  next_page: results.next_page,
                  out_of_bounds: results.out_of_bounds?,
                  offset: results.offset
                }.to_json
              end
          end	

end