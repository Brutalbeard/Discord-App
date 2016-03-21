class Player

  attr_accessor :hit_points, :str, :dex, :int, :con, :cha, :wis, :character_name, :player_id

  def changeHealth (hp)
    @hit_points += hp
  end

  def showStats
    arr = [@hit_points, @str, @dex, @int, @con, @cha, @wis]
    return arr
  end

end
