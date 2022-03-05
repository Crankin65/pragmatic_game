require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

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

    @players.each do |player|
      GameTurn.take_turn(player)
      puts player
    end
    
  end

end