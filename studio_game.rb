require_relative 'game'

#player1 = Player.new("moe")
#player2 = Player.new("larry", 60)
#player3 = Player.new("curly", 125)
klutz = ClumsyPlayer.new("klutz", 105)
berserker = BerserkPlayer.new("berserker", 50)

knuckleheads = Game.new("knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
knuckleheads.add_player(klutz)
knuckleheads.add_player(berserker)

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