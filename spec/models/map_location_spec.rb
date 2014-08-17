require 'rails_helper'

RSpec.describe MapLocation, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:road_info) }

  context "#parse_road_info" do
    subject {described_class.new(name: "example",road_info: "A B 10, B D 15, A C 20")}
    it "return parsed road info" do
      expect(subject.parse_road_info).to eql([["A", "B", "10"], ["B", "D", "15"], ["A", "C", "20"]])
    end
  end
end
