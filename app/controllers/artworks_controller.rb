class ArtworksController < ApplicationController
  before_action :authorize_admin, only: [:edit, :update, :destroy, :new]

	def new
		@artwork=Artwork.new
	end

	def index
		@artworks=Artwork.all
	end

	def show
		@artwork=Artwork.find(params[:id])
	end


	def create
		@artwork=Artwork.new(artwork_params)
		if @artwork.save
			redirect_to artworks_path, notice: 'Artwork was successfully created.'
		else 
			redirect_to artworks_new_path, notice: 'Artwork could not be saved.'
		end
	end

	def edit
		@artwork=Artwork.find(params[:id])
	end

	def update
		@artwork=Artwork.find(params[:id])
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		artwork=Artwork.find(params[:id])
		artwork.destroy
		redirect_to artworks_path, notice: 'Artwork was successfully destroyed.' 
	end

	private
		def artwork_params
      params.require(:artwork).permit(:title, :creator, :medium, :image, :description)
    end
end

