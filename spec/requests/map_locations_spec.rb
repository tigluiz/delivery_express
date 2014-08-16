require 'rails_helper'

RSpec.describe "MapLocations", :type => :request do
  describe "GET /map_locations" do
    it "return success code" do
      get map_locations_path
      expect(response.status).to be(200)
    end
  end
end
