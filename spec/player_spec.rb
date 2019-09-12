require "./lib/player"
require "./lib/token"
require "./lib/cell"
require "./lib/board"

describe Player do
  board = Board.new
  player1 = Player.new("Player 1", "X", board)
  column_no = 0
  cell0 = board.columns[column_no][0]
  describe "#play_token" do
    it "correctly updates the cell position in the board for each player turn" do
      player1.play_token(column_no)
      expect(cell0.owner).to eql(player1.name)
    end
  end

  describe "#play_token" do
    it "correctly updates the cell if previous cell is already occupied" do
      cell1 = board.columns[column_no][1]
      player1.play_token(column_no)
      expect(cell1.owner).to eql(player1.name)
      expect(cell1.value).to eql(" X ")
    end
  end
end
