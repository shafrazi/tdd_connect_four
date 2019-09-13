require "./lib/player"
require "./lib/token"
require "./lib/cell"
require "./lib/board"
require "./lib/game"

describe Game do
  game = Game.new
  game1 = Game.new

  describe "#create_players" do
    it "returns an array of 2 players" do
      game.create_players
      expect(game.players.class).to eql(Array)
      expect(game.players.length).to eql(2)
      expect(game.players[0].symbol).to eql("X")
    end
  end

  describe "#active_player" do
    it "returns the current active player" do
      expect(game.active_player.name).to eql("Player 1")
    end
  end

  describe "#switch_players" do
    it "changes the active status of players" do
      game.switch_players
      expect(game.active_player.name).to eql("Player 2")
      game.switch_players
      expect(game.active_player.name).to eql("Player 1")
    end
  end

  describe "#check_for_win" do
    it "returns true if horizontally cells are positioned correctly" do
      player1 = game.players[0]
      player1.play_token(0)
      player1.play_token(2)
      player1.play_token(3)
      player1.play_token(4)
      expect(game.check_for_win(player1.play_token(5))).to eql(true)
    end

    it "returns true if vertically cells are positioned correctly" do
      game1_player1 = game1.players[0]
      game1_player1.play_token(4)
      game1_player1.play_token(4)
      game1_player1.play_token(4)
      expect(game1.check_for_win(game1_player1.play_token(4))).to eql(true)
    end

    it "returns true if diagonally cells are positioned correctly at the right direction" do
      game2 = Game.new
      game2_player2 = game1.players[1]
      cells = game2.board.cells
      cells[0][0].owner = "Player 2"
      cells[1][1].owner = "Player 2"
      cells[2][2].owner = "Player 2"
      cells[3][3].owner = "Player 2"
      expect(game2.check_for_win(cells[3][3])).to eql(true)
    end

    it "returns true if diagonally cells are positioned correctly at the left direction" do
      game3 = Game.new
      game3_player2 = game3.players[1]
      cells = game3.board.cells
      cells[1][5].owner = "Player 2"
      cells[2][4].owner = "Player 2"
      cells[4][2].owner = "Player 2"
      cells[3][3].owner = "Player 2"
      expect(game3.check_for_win(cells[3][3])).to eql(true)
    end
  end
end
