class RoadCalculator
  def initialize(roads)
    @roads = roads
  end

  def apply
    raise "must be array" unless @roads.is_a?(Array)
  end

end
