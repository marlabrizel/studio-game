require_relative 'game'
require_relative 'game_turn'

describe Game do

	before do
		@game = Game.new("knuckleheads")

		@initial_health = 100
		@player = Player.new("moe", @initial_health)

		@game.add_player(@player)
	end

	it "w00ts a player when a high number is rolled" do
		allow_any_instance_of(Die).to receive(:roll).and_return(5)

		@game.play(2) 

		expect(@player.health).to eq(@initial_health + 15 * 2)
	end

	it "skips a player when a medium number is rolled" do
		allow_any_instance_of(Die).to receive(:roll).and_return(3)

		@game.play(2)

		expect(@player.health).to eq(@initial_health)
	end


	it "blams a player when a low number is rolled" do
		allow_any_instance_of(Die).to receive(:roll).and_return(1)

		@game.play(2)

		expect(@player.health).to eq(@initial_health - 10 *2)
	end

	it "assigns a treasure for points during a player's turn" do
		game = Game.new("knuckleheads")
		player = Player.new("moe")

		game.add_player(player)

		game.play(1)

		expect(player.points).not_to be_zero
	end

end