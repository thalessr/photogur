class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
		@most_recent_pictures = Picture.most_recent_five
	end
	
	def show
	    @picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
	    @picture = Picture.new(picture_params)
		if @picture.save
			redirect_to pictures_url
		else
			render :new
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes(picture_params)
			redirect_to @picture
		else
			render :edit
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_url
	end

	private
	def picture_params
		params.require(:picture).permit(:artist, :title, :url)
	end

	def self.created_before(time)
		where("created_at < ?", time)
	end

end
