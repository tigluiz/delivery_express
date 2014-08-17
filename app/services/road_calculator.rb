class RoadCalculator
  def initialize(chossen_road,roads)
    @user_road_info = chossen_road
    @roads = roads
    @distance = 0
    @road = ""
  end

  def apply
    raise "Must receive map location array" unless @roads.is_a?(Array)
    choose_best_road
  end

  private

  def choose_best_road
    chossen = @roads.map{|road| road if( road.join(" ").match(@user_road_info[:origin]) && road.join(" ").match(@user_road_info[:destiny]))}.compact.flatten
    @road = chossen[0] + chossen[1]
    @road.reverse! if need_reverse?
    @distance = @distance += chossen[2].to_i
    {road: @road, cost: calculate_cost}
  end

  def calculate_cost
    BigDecimal(@distance) / BigDecimal(@user_road_info[:autonomy]) * BigDecimal(@user_road_info[:gas_value])
  end

  def need_reverse?
    !!(!@road.match(@user_road_info[:origin] + @user_road_info[:destiny]))
  end

end
