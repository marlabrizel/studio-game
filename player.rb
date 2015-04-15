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

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end