class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #  def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end

  before_action :authenticate_user

  private 
  	def render_errors(errors)
    	render json: { errors: errors }, status: 422
    end

    def authenticate_user
      unless logged_in?
        respond_to do |format|
          format.html { redirect_to :sign_in, alert: 'You need to login' }
          format.json { render :json => { :result => false,status: UNAUTHORIZE_ACCESS_CODE ,:message => "User not found!" } }
        end
      end
    end

 
    def logged_in?
      !!current_user && token_expiry
    end

    def token_expiry
      if current_user.token_expiry < Time.now
        redirect_to :sign_in, alert: 'You need to login' 
      else
        true
      end
    end

      


end
