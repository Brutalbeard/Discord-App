class Player

  def initialize(userId, name)
    @player_id = userId
    @charcter_name = name
  end

  def getStats(health, strength, dexterity, intelligence, consitution, charisma, wisdom)
    @hit_points = health
    @str = strength
    @dex = dexterity
    @int = intelligence
    @con = consitution
    @cha = charisma
    @wis = wisdom
  end

  def changeHealth (hp)
    @hit_points += hp
  end

  def showStats
    arr = [@hit_points, @str, @dex, @int, @con, @cha, @wis]
    return arr
  end





end
