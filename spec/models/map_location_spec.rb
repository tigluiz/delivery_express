require 'rails_helper'

RSpec.describe MapLocation, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:road_info) }
end
