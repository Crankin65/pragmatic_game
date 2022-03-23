class Player
  attr_reader :health
  attr_accessor :name
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
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
    @health + points
  end
  
  def strong?
    @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0) { |sum, n| sum + n}
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