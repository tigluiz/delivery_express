require 'rails_helper'

RSpec.describe "map_locations/show", :type => :view do
  before(:each) do
    @map_location = assign(:map_location, MapLocation.create!(
      :name => "Name",
      :road_info => "Road Info"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Road Info/)
  end
end
