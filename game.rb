require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

	attr_reader :title

	def initialize (title)
		@title = title.capitalize
		@players = []
	end

	def add_player (new_player)
		@players << new_player
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end

	def print_stats
		strong_players, wimpy_players = @players.partition { |player| player.strong? }
		
		puts "\n#{title} Statistics"

		puts "\n#{strong_players.size} Strong Players:"
		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{wimpy_players.size} Wimpy Players:"
		wimpy_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{@title} High Scores:"
		@players.sort.each do |player|
			formatted_name = player.name.ljust(20, '.')
			puts "#{formatted_name} #{player.score}"
		end

	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}."
		
		@players.each do |player|
			puts player
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points."
		end
	end
end