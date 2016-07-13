class Api::V1::ImagesController < Api::V1::ApisController

    def create
    	@image = Image.new(image_params.
    					merge(imageable_id: get_user.id)
    				)
    	if @image.save
    		render :json => {result: true,object: ImageSerializer.new(@image, :root => false) }
    	else
    		render_errors @image.errors.full_messages
    	end
    end

    def show
    	@images = find_images
    	render :json => {result: true,object: @images}
    end
  
  
  private
    def image_params
        params.require(:image).permit(:image, :lat, :long,:imageable_type,:model)
    end

    def find_images
    	Image.where(imageable_type: params[:imageable_type],imageable_id: get_user.id)
    end

    def get_user
    	User.get_user(token)
    end

end