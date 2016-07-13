class ViewPagersController < Api::V1::ApisController

	def index
		@view_pagers = ViewPager.where(status: ACTIVE).pluck(:id,:url)
		render :json => {result: true, url: @view_pagers}
	end

	def create
		@view_pager = ViewPager.new view_pager_params 
		if @view_pager.save
    		url = ViewPagerSerializer.new(@view_pager, :root => false)
    		full_url = BASE_URL+url.image_url
    		@view_pager.update(url: full_url)
    		render :json => {result: true,object: full_url}
    	else
    		render_errors @image.errors.full_messages
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