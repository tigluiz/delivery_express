require File.expand_path( File.join( File.dirname(__FILE__), '../../app/services/road_calculator' ) )

describe RoadCalculator do

  context "#apply" do
    context "with wrong params" do
      it "should raise error" do
        expect(lambda{described_class.new("something", "something").apply}).to raise_error
      end
    end
    context "with correct params" do
      context "With short roads" do
        let(:user_choice) {{origin: "A", destiny: "B", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {["A B 10", "B C 15"]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "AB", cost: "2.5"})
        end
      end
    end
  end
end
