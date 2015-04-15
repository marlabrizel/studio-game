require_relative 'player'

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

def bark
	puts "Woof woof woof!"
end

@players.each do |player|
	player.blam
	player.w00t
	player.w00t
	puts player
end
end
end