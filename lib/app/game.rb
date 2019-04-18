class Game
  attr_reader :board, :player1, :player2, :displayer

  def initialize
    @displayer = Displayer.new
    @displayer.welcome
    @player1 = Player.new("Premier")
    @player2 = Player.new("Second")
    @board = Board.new
  end

  def perform
    unless board.check_for_end_of_game
      take_turns
    end  
  end

  def player_turn(player)
    @displayer.display_grid
    move = board.convert_move(player.play_move)

    until @board.cell_is_empty?(move)
      move = board.convert_move(player.play_move)
    end
    
  end

  def take_turns
    player_turn(@player1)
    player_turn(@player2)
  end
end