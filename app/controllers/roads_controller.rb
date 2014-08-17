class RoadsController < ApplicationController
  def index
    @maps = MapLocation
  end

  def create
    @map = MapLocation.find params[:id]
    @road_info = RoadCalculator.new(parse_user_info(params) ,@map.parse_road_info).apply
  end

  def show
    @map = MapLocation.find params[:id]
  end

  private
  def parse_user_info params
   {origin: params[:origin], destiny: params[:destiny], autonomy: params[:autonomy], gas_value: params[:gas_value]} 
  end
end
