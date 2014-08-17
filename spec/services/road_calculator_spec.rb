require File.expand_path( File.join( File.dirname(__FILE__), '../../app/services/road_calculator' ) )

describe RoadCalculator do

  context "#apply" do
    context "with"
    it "should have map location array" do
      expect(lambda{described_class.new("something").apply}).to raise_error
    end
  end
end
