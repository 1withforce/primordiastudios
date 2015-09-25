class RoyalHousesController < ApplicationController
	before_action :set_royal_house, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:edit, :update, :destroy, :new]
 
	# GET /royal_houses
  # GET /royal_houses.json
  def index
    @royal_houses = RoyalHouse.all
  end

  # GET /royal_houses/1
  # GET /royal_houses/1.json
  def show
  end

  # GET /royal_houses/new
  def new
    @royal_house = RoyalHouse.new
  end

  # GET /royal_houses/1/edit
  def edit
  end

  # POST /royal_houses
  # POST /royal_houses.json
  def create
    @royal_house = RoyalHouse.new(royal_house_params)

    respond_to do |format|
      if @royal_house.save
        format.html { redirect_to @royal_house, notice: 'Royal house was successfully created.' }
        format.json { render :show, status: :created, location: @royal_house }
      else
        format.html { render :new }
        format.json { render json: @royal_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /royal_houses/1
  # PATCH/PUT /royal_houses/1.json
  def update
    respond_to do |format|
      if @royal_house.update(royal_house_params)
        format.html { redirect_to @royal_house, notice: 'Royal house was successfully updated.' }
        format.json { render :show, status: :ok, location: @royal_house }
      else
        format.html { render :edit }
        format.json { render json: @royal_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /royal_houses/1
  # DELETE /royal_houses/1.json
  def destroy
    @royal_house.destroy
    respond_to do |format|
      format.html { redirect_to royal_houses_url, notice: 'Royal house was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_royal_house
      @royal_house = RoyalHouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def royal_house_params
      params.require(:royal_house).permit(:name, :alliance, :description)
    end
end
