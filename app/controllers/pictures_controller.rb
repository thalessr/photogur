class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end
	
	def show
	    @picture = @pictures[params[:id]]
	end

	def new
	end

	def create
		render :text => "Saving a picture. Url:#{params[:url]}, title #{params[:title]}, Artist #{params[:artist]} "
	end

end
