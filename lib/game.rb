require_relative "board"
require_relative "player"
require_relative "token"
require_relative "cell"

class Game
  attr_accessor :board, :players, :game_won, :game_complete

  def initialize
    @board = Board.new
    @players = self.create_players
    @game_complete = false
    @game_won = false
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
    target_diagonal_right = board.create_diagonal(cell, "right")
    target_diagonal_left = board.create_diagonal(cell, "left")
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

    # diagonal upward right
    i = 0
    while i < target_diagonal_right.length && sequence != 4
      if target_diagonal_right[i].owner == cell.owner
        sequence += 1
      else
        sequence = 0
      end
      i += 1
    end

    # diagonal upward left
    i = 0
    while i < target_diagonal_left.length && sequence != 4
      if target_diagonal_left[i].owner == cell.owner
        sequence += 1
      else
        sequence = 0
      end
      i += 1
    end

    if sequence == 4
      win_status = true
      self.game_won = true
    end
    win_status
  end

  def update_game_status
    if board.all_cells.all? { |cell| cell.occupied } && !game_won
      self.game_complete = true
      puts "Game drawn!"
    elsif self.game_won
      board.display_board
      self.game_complete = true
      puts "#{active_player.name} won! "
    end
  end

  def start_game
    while !self.game_complete
      board.display_board
      puts "#{active_player.name} enter the column number to play token:"
      input = gets.chomp.to_i
      cell = active_player.play_token(input)
      check_for_win(cell)
      update_game_status
      switch_players
    end
  end
end
