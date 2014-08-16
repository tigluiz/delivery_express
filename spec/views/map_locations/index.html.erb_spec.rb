require 'rails_helper'

RSpec.describe "map_locations/index", :type => :view do
  before(:each) do
    assign(:map_locations, [
      MapLocation.create!(
        :name => "Name",
        :road_info => "Road Info"
      ),
      MapLocation.create!(
        :name => "Name",
        :road_info => "Road Info"
      )
    ])
  end

  it "renders a list of map_locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Road Info".to_s, :count => 2
  end
end
