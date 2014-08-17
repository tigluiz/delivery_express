require 'rails_helper'

RSpec.describe RoadsController, :type => :controller do

  let!(:map_location) {MapLocation.create(name: "example", road_info: "A B 10, B C 15" )}
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :show, id: map_location.id
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      post :create, {"utf8"=>"✓", "authenticity_token"=>"tQMPT1+lHxByM9iOV3+a8tutOayQx8Na5e3zlFNFSj8=", "id"=>"1", "origin"=>"A", "destiny"=>"B", "autonomy"=>"10", "gas_value"=>"2.5", "commit"=>"Enviar"}
      expect(response).to be_success
    end
  end

end
