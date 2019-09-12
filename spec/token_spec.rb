require "./lib/token"
require "./lib/cell"
require "./lib/board"

describe Token do
  board = Board.new
  token = Token.new("X", "Player 1", board)
  cell = board.cells[0][0]
  describe "#drop" do
    it "updates the occupied cell's owner" do
      token.drop(0)
      expect(cell.owner).to eql("Player 1")
    end
  end

  describe "#drop" do
    it "updates the occupied cell owner correctly if the columns previous cell is already occupied" do
      column_no = 0
      cell1 = board.columns[column_no][1]
      token.drop(column_no)
      expect(cell1.owner).to eql("Player 1")
    end
  end
end
