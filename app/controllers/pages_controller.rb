class PagesController < ApplicationController
	
	before_action :set_story
	before_action :set_page, only: [:show, :edit, :update, :destroy]
	before_action :authorize_admin, only: [:edit, :update, :destroy, :new, :create]	

	def index
		@pages = @story.pages.all
	end

	def new
		@page = Page.new
	end

	def create
		@page = @story.pages.create(page_params)
		redirect_to story_path(@story)
	end 
	
	def show
	end	
	
	def edit
	end

	def update
	
	end
	
	def destroy
		@page.destroy
		redirect_to story_pages_path(@story)
	end
	
	
	private
		def page_params
			params.require(:page).permit(:image, :page_num, :text, :story_id)
		end

		def set_story
			@story = Story.find(params[:story_id])
		end
		
		def set_page
			@page = @story.pages.find(params[:id])
		end
end
