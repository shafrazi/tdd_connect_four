require_relative "board"
require_relative "game"
require_relative "token"
require_relative "player"
require_relative "cell"
# Initially the board should be displayed.
# Player 1 should be assigned and token "X" should be assigned.
# Prompt for the column number where the token should be dropped. (0-6)
# Once input is received, display the board with the updated input and repeat process.

game = Game.new
game.start_game
