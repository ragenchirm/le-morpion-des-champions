class Game
  attr_reader :board, :player1, :player2, :displayer, :game_count, :p1_points, :p2_points, :switch_players

  def initialize
    @displayer = Displayer.new
    @displayer.welcome
    @player1 = Player.new("Premier", 1)
    @player2 = Player.new("Second", 2)
    @displayer.get_symbols(@player1.symbol, @player2.symbol)
    @p1_points=0
    @p2_points=0
    @game_count=1
    @board = Board.new
    @switch_players = false
  end

  def perform
    until result = board.check_for_end_of_game
      player_turn(@player1)
      player_turn(@player2) unless board.check_for_end_of_game
    end
    refresh_grid
    game_over(result)
    wanna_replay?
  end

  def perform_reverse
    until result = board.check_for_end_of_game
      player_turn(@player2)
      player_turn(@player1) unless board.check_for_end_of_game
    end
    refresh_grid
    game_over(result)
    wanna_replay?
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
    puts "Partie n° #{@game_count}"
    puts "Scores : |#{player1.name} : #{@p1_points}|#{player2.name} : #{@p2_points}|"
  end

  def game_over(result)
    puts "\n\n"
    winner = who_is_winner?(result)
    puts "\n"
    type_of_victory(result[1], winner) if result.class == Array
  end

  def victory_sound(message)
    if OS.mac?
      system("say #{message}")
    else OS.linux?
      system("echo #{message}|espeak")
    end
  end

  def who_is_winner?(result)
    if result.class == String
      puts "Vous vous êtes mutuellement coincés."
    elsif result[0] == "P1"
      puts "Avant #{@player2.name} habitait en face du cimetière. Maintenant, il habite en face de chez lui."
      @p1_points +=1
      victory_sound('Player1 crushed his foe. Player2 is a pathetic loser.')
      return @player1
    else
      puts "Dans ce monde, il y a deux types de personnes. Ceux qui ont un pistolet et ceux qui creusent. #{@player1.name}, il creuse."
      @p2_points +=1
      victory_sound('Player2 took the skull of his foe as his personal goblet and impaled his body.')
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

  def wanna_replay?
    while true
      puts "Ca en refait une chtite ma biche ? (y/n)"
      puts "(Par contre on change l'ordre de jeu !)"
      print ">"
      choice = gets.chomp
      if !choice.match?(/^y(es)?$/i) && !choice.match?(/^n(o)?$/i)
        puts "Merci de rentrer un choix correct gougnafier !"
      end
      break if choice.match?(/^y(es)?$/i) ||choice.match?(/^n(o)?$/i)
    end

    if choice.match?(/^y(es)?$/i)
      @board = Board.new
      @game_count += 1
      @switch = !@switch
      if @switch
        perform_reverse
      else
        perform
      end
    end

  end



end
