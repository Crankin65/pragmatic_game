require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

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
    puts "\nThere are #{@players.size} players in the #{@title}:" 

    @players.each do |person|
      puts person
    end

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.length} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
      

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        #puts player
      end 
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def total_points
    @players.reduce(0) {|sum, player| sum + player.points}
  end 

  def print_stats
    puts "\n#{total_points} total points from treasures found"
    
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    strong_players, wimpy_players = @players.partition {|player| player.strong?}

    puts "\n#{@title} Statistics"
    
    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure| 
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end


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