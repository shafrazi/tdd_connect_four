require_relative "cell"

class Board
  attr_accessor :columns, :rows, :cells, :border

  def initialize
    @columns = 7
    @rows = 6
    @cells = self.create_cells
    @border = "---+---+---+---+---+---+---"
  end

  def create_cells
    cells = []
    y = 0
    while y < rows
      x = 0
      row = []
      while x < columns
        cell = Cell.new(x, y)
        row << cell
        x += 1
      end
      cells << row
      y += 1
    end
    cells
  end

  def display_board
    cell_indices = [" 0 ", " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 "]
    puts "    "
    puts cell_indices.join("|")
    puts border
    cells.each do |row|
      cell_values = []
      cell_values = row.map { |i| i.value }
      puts cell_values.join("|")
      puts border
    end
    puts "    "
  end
end

board = Board.new
board.display_board
