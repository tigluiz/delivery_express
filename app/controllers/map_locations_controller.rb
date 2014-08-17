class MapLocationsController < ApplicationController
  before_action :set_map_location, only: [:show, :edit, :update, :destroy]

  def index
    @map_locations = MapLocation.all
  end

  def show
  end

  def new
    @map_location = MapLocation.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @map_location.update(map_location_params)
        format.html { redirect_to @map_location, notice: 'Seu mapa foi atualizado.' }
        format.json { render :show, status: :ok, location: @map_location }
      else
        format.html { render :edit }
        format.json { render json: @map_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @map_location.destroy
    respond_to do |format|
      format.html { redirect_to map_locations_url, notice: 'Seu mapa foi apagado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_map_location
      @map_location = MapLocation.find(params[:id])
    end

    def map_location_params
      params.require(:map_location).permit(:name, :road_info)
    end
end
