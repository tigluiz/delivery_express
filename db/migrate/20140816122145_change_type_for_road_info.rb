class ChangeTypeForRoadInfo < ActiveRecord::Migration
  def change
    change_column :map_locations, :road_info, :text
  end
end
