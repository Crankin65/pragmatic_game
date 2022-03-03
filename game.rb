require_relative 'player'

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
      person.blam
      person.w00t
      person.w00t
      puts person
    end
  end

end