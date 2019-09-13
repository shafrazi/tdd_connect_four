class Token
  attr_accessor :symbol, :owner, :board

  def initialize(symbol, player, board)
    @symbol = symbol
    @owner = player
    @board = board
  end

  def drop(column_no)
    # updates cell info and returns the cell
    next_available_cell = board.find_available_cell(column_no)
    if next_available_cell
      next_available_cell.update_cell(self)
      next_available_cell
    end
  end
end
