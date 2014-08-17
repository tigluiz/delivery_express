class RoadCalculator
  def initialize(roads)
    @roads = roads
  end

  def apply
    raise "Must receive map location array" unless @roads.is_a?(Array)
  end

end
