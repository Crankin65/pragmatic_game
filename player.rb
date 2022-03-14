class Player
  attr_reader :health
  attr_accessor :name
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    damage = 10
    @health -= damage
    puts "#{@name} got blammed for #{damage} points."
  end

  def w00t
    heal = 15
    @health += heal
    puts "#{@name} got w00ted for #{heal} points."
  end

  def score
    @health + @name.length
  end
  
  def strong?
    @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end