require "./lib/board"

describe Board do
  board = Board.new
  describe "#create_cells" do
    it "returns the correct no of cells of the board" do
      cells = board.create_cells
      cell_count = 0
      cells.each { |row| cell_count += row.length }
      expect(cell_count).to eql(42)
    end
  end

  describe "#cells" do
    it "x and y of last cell of the board should be 6, 5 respectively" do
      last_row = board.cells.last
      last_cell = last_row.last
      array = []
      array << last_cell.x
      array << last_cell.y
      expect(array).to eql([6, 5])
    end
  end

  describe "#cells" do
    it "x and y of first cell of the board should be 0, 0 respectively" do
      first_row = board.cells.first
      first_cell = first_row.first
      array = []
      array << first_cell.x
      array << first_cell.y
      expect(array).to eql([0, 0])
    end
  end

  describe "#find_available_cell" do
    it "returns the next available cell in the column" do
      occupied_cell = board.cells.first.first
      occupied_cell.owner = "Player 1"
      occupied_cell.occupied = true
      column = 0
      second_row = board.cells[1]
      second_row_first_cell = second_row[0]
      expect(board.find_available_cell(column)).to eql(second_row_first_cell)
    end
  end

  describe "#all_cells" do
    it "returns the number of all cells correctly" do
      expect(board.all_cells.length).to eql(42)
    end
  end
end
