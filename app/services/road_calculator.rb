class RoadCalculator
  def initialize(chossen_road,roads)
    @user_road_info = chossen_road
    @roads = roads
    @distance = 0
    @road = ""
    @inverted = chossen_road[:origin] > chossen_road[:destiny]
  end

  def apply
    raise "Must receive map location array" unless @roads.is_a?(Array)
    choose_best_road
  end

  private

  def choose_best_road
    @road += @user_road_info[:origin]
    seek_road(@roads,@user_road_info[:origin], @user_road_info[:destiny])
    {road: @road, cost: calculate_cost}
  end

  def seek_road(rods , o , oo)
    _road = (rods).map{|road| road if( road.join(" ").match(o) && road.join(" ").match(oo))}.compact
    if _road.size == 1
      _road = _road.flatten
      if @inverted
        @road += _road[1] unless @road.include?(_road[1])
        @road += _road[0] unless @road.include?(_road[0])
      else
        @road += _road[0] unless @road.include?(_road[0])
        @road += _road[1] unless @road.include?(_road[1])
      end
      @distance = @distance += _road[2].to_i
      return _road
    else
      _roads = @roads.map{|road| road if( road.join(" ").match(@road))}.compact
      aroad = _roads.sort{|a,b| a[2] <=> b[2]}.first
      aroads = @roads.delete_if{|f| f.join(" ").include?(@road)}
      @distance = @distance += aroad[2].to_i
      if @inverted
        seek_road(aroads, aroads[0][1], oo)
      else
        seek_road(aroads, aroads[0][0], oo)
      end
    end
  end

  def calculate_cost
    BigDecimal(@distance) / BigDecimal(@user_road_info[:autonomy]) * BigDecimal(@user_road_info[:gas_value])
  end

  def need_reverse?
    !!(!@road.match(@user_road_info[:origin] + @user_road_info[:destiny]))
  end

end
