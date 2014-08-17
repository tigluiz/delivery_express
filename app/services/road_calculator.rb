class RoadCalculator
  def initialize(chossen_road,roads)
    @user_road_info = chossen_road
    @roads = roads
  end

  def apply
    raise "Must receive map location array" unless @roads.is_a?(Array)
  end

  private

  def choose_best_road
    
  end

end
