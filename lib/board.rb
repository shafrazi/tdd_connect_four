require_relative "cell"

class Board
  attr_accessor :column_no, :row_no, :cells, :border, :columns

  def initialize
    @column_no = 7
    @row_no = 6
    @cells = self.create_cells
    @border = "---+---+---+---+---+---+---"
    @columns = self.generate_columns(cells)
  end

  def create_cells
    cells = []
    y = 0
    while y < row_no
      x = 0
      row = []
      while x < column_no
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
    i = row_no - 1
    while i >= 0
      cell_values = []
      cell_values = cells[i].map { |i| i.value }
      puts cell_values.join("|")
      puts border
      i -= 1
    end
    puts "    "
  end

  def generate_columns(cells)
    columns = []
    x = 0
    while x <= 6
      y = 0
      column = []
      while y <= 5
        column << cells[y][x]
        y += 1
      end
      columns << column
      x += 1
    end
    columns
  end

  def find_available_cell(column_no)
    column = columns[column_no]
    next_available_cell = column[0]
    i = 0
    while i < column.length
      if column[i].occupied
        next_available_cell = column[i + 1]
      else
        break
      end
      i += 1
    end
    next_available_cell
  end

  def create_diagonal(cell, direction)
    x = cell.x
    y = cell.y
    diagonal_cells = []
    if direction == "right"
      if (x - y) >= 0
        starting_x = x - y
        starting_y = 0
      else
        starting_x = 0
        starting_y = y - x
      end

      while starting_x <= 6 && starting_y <= 5
        diagonal_cells << cells[starting_y][starting_x]
        starting_x += 1
        starting_y += 1
      end
    elsif direction == "left"
      if (x + y) <= 6
        starting_x = x + y
        starting_y = 0
      else
        starting_x = 6
        starting_y = (x + y) - 6
      end

      while starting_x >= 0 && starting_y <= 5
        diagonal_cells << cells[starting_y][starting_x]
        starting_x -= 1
        starting_y += 1
      end
    end
    diagonal_cells
  end

  def all_cells
    all_cells = []
    cells.each do |row|
      row.each { |cell| all_cells << cell }
    end
    all_cells
  end
end
