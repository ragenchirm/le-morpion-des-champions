class Game
  attr_reader :board, :player1, :player2, :displayer

  def initialize
    @displayer = Displayer.new
    @displayer.welcome
    @player1 = Player.new("Premier", 1)
    @player2 = Player.new("Second", 2)
    @displayer.get_symbols(@player1.symbol, @player2.symbol)
    @board = Board.new
  end

  def perform
    until result = board.check_for_end_of_game
      player_turn(@player1)
      player_turn(@player2) unless board.check_for_end_of_game
    end
    refresh_grid
    game_over(result)
  end

  def player_turn(player)
    refresh_grid
    puts "\n\n"
    move = board.convert_move(player.play_move)
    until @board.cell_is_empty?(move)
      move = board.convert_move(player.play_move)
    end
    @board.play(player.player_number, move)
  end

  def refresh_grid
    system("clear")
    @displayer.display_grid(board.boxes)
  end

  def game_over(result)
    puts "\n\n"
    winner = who_is_winner?(result)
    puts "\n"
    type_of_victory(result[1], winner) if result.class == Array
  end

  def who_is_winner?(result)
    if result.class == String
      puts "Vous vous êtes mutuellement coincés."
    elsif result[0] == "P1"
      puts "Avant #{@player2.name} habitait en face du cimetière. Maintenant, il habite en face de chez lui."
      return @player1
    else
      puts "Dans ce monde, il y a deux types de personnes. Ceux qui ont un pistolet et ceux qui creusent. #{@player1.name}, il creuse."
      return player2
    end
  end

  def type_of_victory(victory, winner)
    case victory[0]
    when "C"
      type = "colonne"
    when "L"
      type = "rangée"
    when "D"
      type = "diagonale"
    end

    case victory[1]
    when "1"
      rank = "première"
    when "2"
      rank = "seconde"
    when "3"
      rank = "troisième"
    end 

    puts "#{winner.name} a triomphé en remplissant la #{rank} #{type}"
  end
end
