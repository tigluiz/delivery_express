class MapLocationsController < ApplicationController
  before_action :set_map_location, only: [:show, :edit, :update, :destroy]

  # GET /map_locations
  # GET /map_locations.json
  def index
    @map_locations = MapLocation.all
  end

  # GET /map_locations/1
  # GET /map_locations/1.json
  def show
  end

  # GET /map_locations/new
  def new
    @map_location = MapLocation.new
  end

  # GET /map_locations/1/edit
  def edit
  end

  # POST /map_locations
  # POST /map_locations.json
  def create
    @map_location = MapLocation.new(map_location_params)

    respond_to do |format|
      if @map_location.save
        format.html { redirect_to @map_location, notice: 'Seu mapa foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @map_location }
      else
        format.html { render :new }
        format.json { render json: @map_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /map_locations/1
  # PATCH/PUT /map_locations/1.json
  def update
    respond_to do |format|
      if @map_location.update(map_location_params)
        format.html { redirect_to @map_location, notice: 'Map location was successfully updated.' }
        format.json { render :show, status: :ok, location: @map_location }
      else
        format.html { render :edit }
        format.json { render json: @map_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_locations/1
  # DELETE /map_locations/1.json
  def destroy
    @map_location.destroy
    respond_to do |format|
      format.html { redirect_to map_locations_url, notice: 'Map location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map_location
      @map_location = MapLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_location_params
      params.require(:map_location).permit(:name, :road_info)
    end
end
