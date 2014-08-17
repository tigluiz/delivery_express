class MapLocation < ActiveRecord::Base
  validates :name, :road_info, presence: true

  def parse_road_info
    road_info.split(",").map{|road| road.split(" ")}
  end
end
