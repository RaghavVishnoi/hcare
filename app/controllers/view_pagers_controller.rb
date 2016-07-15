class ViewPagersController < ApplicationController
 

	def index
		@view_pagers = ViewPager.where(status: ACTIVE).pluck(:id,:url)
		render :json => {result: true, url: @view_pagers}
	end

	def new
		@view_pager = ViewPager.new
		@view_pagers = ViewPager.all
	end

	def create
		@view_pager = ViewPager.new view_pager_params 
  		if @view_pager.save
     		url = ViewPagerSerializer.new(@view_pager, :root => false)
    		full_url = BASE_URL+url.image_url
    		@view_pager.update(url: full_url)
    		  
    		  respond_to do |format|
			      format.html { redirect_to new_view_pager_path }
			      format.json { render result: true,object: full_url}
			   end
    		#render :json => {result: true,object: full_url}
    	else
    		render_errors @view_pager.errors.full_messages
    	end
	end

	def update
		@view_pager = ViewPager.find(params[:id])
		@view_pager.update_attributes(view_pager_params)
		render :json => {object: @view_pager}
	end

	def view_pager_params
		params.require(:view_pager).permit(:view_pager,:status,:url)
	end

end