class MapLocation < ActiveRecord::Base
  validates :name, :road_info, presence: true
end
