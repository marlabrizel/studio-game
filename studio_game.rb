require_relative 'game'

#player1 = Player.new("moe")
#player2 = Player.new("larry", 60)
#player3 = Player.new("curly", 125)

knuckleheads = Game.new("knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
	puts "\nHow many rounds? ('quit' to exit)"
	rounds = gets.chomp.downcase
	case rounds
	when /^\d+$/
		knuckleheads.play(rounds.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end

knuckleheads.save_high_scores