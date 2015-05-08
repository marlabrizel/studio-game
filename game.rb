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

		@players.each do |player|
			puts "\n#{player.name}'s point totals:"
				player.each_found_treasure do |treasure|
					puts "#{treasure.points} total #{treasure.name} points"
				end
			puts "#{player.points} grand total points"
		end

		puts "\n#{total_points} total points from treasures found."

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

	def total_points
		@players.reduce(0) { |sum, player| sum + player.points }
	end

	def load_players(from_file)
		File.readlines(from_file).each do |line|
			name, health = line.split(',')
			player = Player.new(name, Integer(health))
			add_player(player)
		end
	end

	def save_high_scores(to_file="high_scores.txt")
		File.open(to_file, "w") do |file|
			file.puts "#{title} High Scores:"
			@players.sort.each do |player|
				formatted_name = player.name.ljust(20, '.')
				file.puts "#{formatted_name} #{player.score}"
			end
		end
	end

end