require 'rails_helper'

RSpec.describe "map_locations/edit", :type => :view do
  before(:each) do
    @map_location = assign(:map_location, MapLocation.create!(
      :name => "MyString",
      :road_info => "MyString"
    ))
  end

  it "renders the edit map_location form" do
    render

    assert_select "form[action=?][method=?]", map_location_path(@map_location), "post" do

      assert_select "input#map_location_name[name=?]", "map_location[name]"

      assert_select "textarea#map_location_road_info[name=?]", "map_location[road_info]"
    end
  end
end
