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

  def play(rounds)
    puts "There are #{@players.size} players in the #{@title}:" 

    @players.each do |person|
      puts person
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end 
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_players, wimpy_players = @players.partition {|player| player.strong?}

    puts "\n#{@title} Statistics"
    
    puts "\n#{strong_players.length} strong players:"
    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy_players.length} wimpy players:"
    wimpy_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20,'.')
      puts "#{formatted_name} #{player.score}"
    end
  end

end