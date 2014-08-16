require "rails_helper"

RSpec.describe MapLocationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/map_locations").to route_to("map_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/map_locations/new").to route_to("map_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/map_locations/1").to route_to("map_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/map_locations/1/edit").to route_to("map_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/map_locations").to route_to("map_locations#create")
    end

    it "routes to #update" do
      expect(:put => "/map_locations/1").to route_to("map_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/map_locations/1").to route_to("map_locations#destroy", :id => "1")
    end

  end
end
