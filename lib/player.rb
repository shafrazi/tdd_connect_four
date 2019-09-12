require_relative "token"

class Player
  attr_accessor :name, :symbol, :board, :active

  def initialize(name, symbol, board)
    @name = name
    @symbol = symbol
    @active = false
    @board = board
  end

  def play_token(column_no, board = self.board)
    token = Token.new(self.symbol, self.name, board)
    token.drop(column_no)
  end
end
