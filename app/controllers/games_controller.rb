class GamesController < ApplicationController

	before_action :set_game, only: [:show, :edit, :update, :destroy]	# Automatically sets the instance variable @game for the actions that require it
	before_action :authorize_admin, only: [:edit, :update, :destroy, :new] # Check that the user is an admin when admin actions are requested
	
	def index
		@games=Game.all
	end

	def show
	end

	def new
		@game=Game.new
	end
	
	def destroy
		@game.destroy
	end

	def create
		@game=Game.new(game_params)
		if @game.save
			redirect_to @game, notice: "Game page was successfully created"
		else
			render :new
		end
	end

	def edit
	end


	private
		def game_params()
			params.require(:game).permit(:title,:platform,:genre,:link,:description)
		end

		def set_game
			@game=Game.find(params[:id])
		end

end
