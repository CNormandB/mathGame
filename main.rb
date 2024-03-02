require './player'
require './math_game'
require './game_io'

io = GameIO.new
game = MathGame.new(io)
game.run