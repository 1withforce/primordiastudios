class StoriesController < ApplicationController
	
	before_action :set_story, only: [:show, :edit, :update, :destroy]
	before_action :authorize_admin, only: [:edit, :update, :destroy, :new, :create]	

	def index
		@stories = Story.all
	end

	def new
		@story = Story.new
	end

	def create
		@story=Story.new(story_params)
		if @story.save
			redirect_to @story, notice: "Story successfully created"
		else
			render :new
		end
	end 
	
	def show
	end	
	
	def edit
	end

	def update
		if @story.update(story_params)
			redirect_to @story, notice: 'Story was successfully updated.' 
    else
        render :edit 
		end
	end
	
	def destroy
		@story.destroy
	end


	private
		def story_params
			params.require(:story).permit(:cover, :title)
		end
	
		def set_story
			@story = Story.find(params[:id])
		end
end
