require 'rails_helper'

RSpec.describe MapLocationsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # MapLocation. As you add validations to MapLocation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "region",
    road_info: "A B 10, B C 15"}
  }

  let(:invalid_attributes) {
    {name: "", road_info: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MapLocationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all map_locations as @map_locations" do
      map_location = MapLocation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:map_locations)).to eq([map_location])
    end
  end

  describe "GET show" do
    it "assigns the requested map_location as @map_location" do
      map_location = MapLocation.create! valid_attributes
      get :show, {:id => map_location.to_param}, valid_session
      expect(assigns(:map_location)).to eq(map_location)
    end
  end

  describe "GET new" do
    it "assigns a new map_location as @map_location" do
      get :new, {}, valid_session
      expect(assigns(:map_location)).to be_a_new(MapLocation)
    end
  end

  describe "GET edit" do
    it "assigns the requested map_location as @map_location" do
      map_location = MapLocation.create! valid_attributes
      get :edit, {:id => map_location.to_param}, valid_session
      expect(assigns(:map_location)).to eq(map_location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MapLocation" do
        expect {
          post :create, {:map_location => valid_attributes}, valid_session
        }.to change(MapLocation, :count).by(1)
      end

      it "assigns a newly created map_location as @map_location" do
        post :create, {:map_location => valid_attributes}, valid_session
        expect(assigns(:map_location)).to be_a(MapLocation)
        expect(assigns(:map_location)).to be_persisted
      end

      it "redirects to the created map_location" do
        post :create, {:map_location => valid_attributes}, valid_session
        expect(response).to redirect_to(MapLocation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved map_location as @map_location" do
        post :create, {:map_location => invalid_attributes}, valid_session
        expect(assigns(:map_location)).to be_a_new(MapLocation)
      end

      it "re-renders the 'new' template" do
        post :create, {:map_location => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested map_location" do
        map_location = MapLocation.create! valid_attributes
        put :update, {:id => map_location.to_param, :map_location => new_attributes}, valid_session
        map_location.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested map_location as @map_location" do
        map_location = MapLocation.create! valid_attributes
        put :update, {:id => map_location.to_param, :map_location => valid_attributes}, valid_session
        expect(assigns(:map_location)).to eq(map_location)
      end

      it "redirects to the map_location" do
        map_location = MapLocation.create! valid_attributes
        put :update, {:id => map_location.to_param, :map_location => valid_attributes}, valid_session
        expect(response).to redirect_to(map_location)
      end
    end

    describe "with invalid params" do
      it "assigns the map_location as @map_location" do
        map_location = MapLocation.create! valid_attributes
        put :update, {:id => map_location.to_param, :map_location => invalid_attributes}, valid_session
        expect(assigns(:map_location)).to eq(map_location)
      end

      it "re-renders the 'edit' template" do
        map_location = MapLocation.create! valid_attributes
        put :update, {:id => map_location.to_param, :map_location => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested map_location" do
      map_location = MapLocation.create! valid_attributes
      expect {
        delete :destroy, {:id => map_location.to_param}, valid_session
      }.to change(MapLocation, :count).by(-1)
    end

    it "redirects to the map_locations list" do
      map_location = MapLocation.create! valid_attributes
      delete :destroy, {:id => map_location.to_param}, valid_session
      expect(response).to redirect_to(map_locations_url)
    end
  end

end
