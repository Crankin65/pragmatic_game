require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn

  def self.take_turn(player)
    die = Die.new
      
      case die.roll
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped."
      else 
        player.blam
      end
  end

  def self.get_treasure(player)
    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points}"
  end

end