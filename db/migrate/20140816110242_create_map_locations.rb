class CreateMapLocations < ActiveRecord::Migration
  def change
    create_table :map_locations do |t|
      t.string :name
      t.string :road_info

      t.timestamps
    end
  end
end
