require_relative 'game'

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