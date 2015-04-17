require_relative 'player'
require_relative 'die'

class Game

	attr_reader :title

	def initialize (title)
		@title = title.capitalize
		@players = []
	end

	def add_player (new_player)
		@players << new_player
	end

	def play
		puts "There are #{@players.size} players in #{@title}."
		@players.each do |player|
			puts player
		end

		@players.each do |player|
			die = Die.new
			number_rolled = die.roll
			case number_rolled
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} was skipped."
			else
				player.w00t
			end
			puts player
		end
	end
end