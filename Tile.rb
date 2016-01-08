class Tile
  attr_accessor :bombed, :flagged, :revealed

  def initialize(bomb = false)
    @bomb = bomb
    @flag = false
    @reveal = false
  end

  def reveal
    @reveal = true
  end

  def flagged?
    @flag
  end

  def bombed?
    @bomb
  end

  def revealed?
    @reveal
  end

  def neighbors(pos)
    # return list of neighbors
  end

  def neighbors_bomb_count(pos)
    bomb_count = 0
    #return amount of bombs on neighboring tiles
  end

  


end
