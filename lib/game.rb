require_relative "board"
require_relative "player"
require_relative "token"
require_relative "cell"

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = self.create_players
    @game_complete = false
  end

  def create_players
    player_array = []
    player1 = Player.new("Player 1", "X", board)
    player1.active = true
    player2 = Player.new("Player 2", "O", board)
    player_array.push(player1, player2)
    player_array
  end

  def active_player
    active_player = nil
    players.each { |player| active_player = player if player.active }
    active_player
  end

  def switch_players
    player1 = players[0]
    player2 = players[1]
    if player1.active
      player1.active = false
      player2.active = true
    else
      player2.active = false
      player1.active = true
    end
  end

  def check_for_win(cell)
    target_row = board.cells[cell.y]
    target_column = board.columns[cell.x]
    win_status = false

    # horizontal
    sequence = 0
    i = 0
    while i < target_row.length && sequence != 4
      if target_row[i].owner == cell.owner
        sequence += 1
      else
        sequence = 0
      end
      i += 1
    end

    # vertical
    i = 0
    while i < target_column.length && sequence != 4
      if target_column[i].owner == cell.owner
        sequence += 1
      else
        sequence = 0
      end
      i += 1
    end

    if sequence == 4
      win_status = true
    end
    win_status
  end
end
