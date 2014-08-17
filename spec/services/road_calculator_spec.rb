require File.expand_path( File.join( File.dirname(__FILE__), '../../app/services/road_calculator' ) )
require 'bigdecimal'
require "pry"
# require "rails_helper"
describe RoadCalculator do

  context "#apply" do
    context "with wrong params" do
      it "should raise error" do
        expect(lambda{described_class.new("something", "something").apply}).to raise_error
      end
    end
    context "with correct params" do
      context "and same road" do
        let(:user_choice) {{origin: "A", destiny: "B", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {[["A", "B", "10"], ["B", "C", "15"]]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "AB", cost: 2.5})
        end
      end
      context "and same inverted road" do
        let(:user_choice) {{origin: "B", destiny: "A", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {[["A", "B", "10"], ["B", "C", "15"]]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "BA", cost: 2.5})
        end
      end
      context "With two distance points" do
        let(:user_choice) {{origin: "A", destiny: "D", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {[["A", "B", "10"], ["B", "D", "15"], ["A", "C", "20"], ["C", "D", "30"]]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "ABD", cost: BigDecimal("6.25")})
        end
      end
      context "With two distance inverted points" do
        let(:user_choice) {{origin: "D", destiny: "A", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {[["A", "B", "10"], ["B", "D", "15"], ["A", "C", "20"], ["C", "D", "30"]]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "DBA", cost: BigDecimal("6.25")})
        end
      end
      context "With tree distance points", focus: true do
        let(:user_choice) {{origin: "A", destiny: "E", autonomy: 10, gas_value: "2.5"}}
        let(:roads) {[["A", "B", "10"], ["B", "D", "15"], ["A", "C", "20"], ["C", "D", "30"],["B", "E", "50"], ["D", "E", "30"]]}
        it "returns best road" do
          expect(described_class.new(user_choice, roads).apply).to eql({road: "ABE", cost: BigDecimal("15")})
        end
      end
    end
  end
end
