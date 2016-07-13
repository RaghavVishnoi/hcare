class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  private 
  	def render_errors(errors)
    	render json: { errors: errors }, status: 422
    end

end
