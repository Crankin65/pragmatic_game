require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player_name)
    @players.push(player_name)
  end

  def play
    puts "There are #{@players.size} players in the #{@title}:"
    
    @players.each do |person|
      puts person
    end

    @players.each do |person|
      die = Die.new
      
      case die.roll
      when 5..6
        person.w00t
        puts person
      when 3..4
        puts "#{person.name} was skipped."
      else 
        person.blam
        puts person
      end

    end
  end

end