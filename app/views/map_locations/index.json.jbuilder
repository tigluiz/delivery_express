json.array!(@map_locations) do |map_location|
  json.extract! map_location, :id, :name, :road_info
  json.url map_location_url(map_location, format: :json)
end
