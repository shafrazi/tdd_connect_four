require "./lib/token"
require "./lib/cell"
require "./lib/board"

describe Token do
  token = Token.new("X", "Player 1")
  cell = Cell.new(0, 0)
  describe "#drop" do
    it "updates the occupied cell's owner" do
      token.drop(0)
      expect(cell.owner).to eql("Player 1")
    end
  end
end
