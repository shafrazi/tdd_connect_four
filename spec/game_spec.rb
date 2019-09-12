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
      player2 = game1.players[0]
      player2.play_token(4)
      player2.play_token(4)
      player2.play_token(4)
      expect(game1.check_for_win(player2.play_token(4))).to eql(true)
    end
  end
end
