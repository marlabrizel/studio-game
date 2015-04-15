class Player

	attr_reader :health
	attr_accessor :name

def name=(new_name)
	@name = new_name.capitalize
end

def score
	@health + @name.length
end

def initialize (name, health=100)
	self.name = name
	@name = name.capitalize
	@health = health
end

def to_s
	"I'm #{@name} with a health of #{@health} and a score of #{score}."
end

def blam
	@health -=10
	puts "#{@name} got blammed!"
end

def w00t
	@health +=15
	puts "#{@name} got w00ted!"
end

end

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

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

player5 = Player.new("riley", 110)
player6 = Player.new("keller", 95)
player7 = Player.new("penny", 140)

dogs = Game.new("dogs")
dogs.add_player(player5)
dogs.add_player(player6)
dogs.add_player(player7)
dogs.play
dogs.bark