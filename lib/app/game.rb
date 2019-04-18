class Game
  attr_reader :board, :player1, :player2, :displayer

  def initialize
    @displayer = Displayer.new
    @displayer.welcome
    @player1 = Player.new("Premier", 1)
    @player2 = Player.new("Second", 2)
    @displayer.get_symbols(@player1.symbol, @player2.symbol)
    @board = Board.new(@player1.symbol, @player2.symbol)
  end

  def perform
    until board.check_for_end_of_game
      player_turn(@player1)
      player_turn(@player2) unless board.check_for_end_of_game
    end
  end

  def player_turn(player)
    system("clear")
    @displayer.display_grid(board.boxes)
    puts "\n\n"
    move = board.convert_move(player.play_move)

    p board.boxes
    until @board.cell_is_empty?(move)
      move = board.convert_move(player.play_move)
    end
    @board.play(player.player_number, move)
  end
end