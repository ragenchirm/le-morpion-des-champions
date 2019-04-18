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
    core_process(@player1, @player2)
  end

  private

  def core_process(first_player, second_player)
    until result = @board.check_for_end_of_game
      player_turn(first_player)
      player_turn(second_player) unless @board.check_for_end_of_game
    end
    refresh_grid
    game_over(result)
    wanna_replay?
  end

  def perform_reverse
    core_process(@player2, @player1)
  end

  def player_turn(player)
    refresh_grid
    puts "\n\n"
    move = @board.convert_move(player.play_move)
    until @board.cell_is_empty?(move)
      move = @board.convert_move(player.play_move)
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
    blinking
    puts "\n\n"
    winner = who_is_winner?(result)
    puts "\n"
    type_of_victory(result[1], winner) if result.class == Array
  end

  def who_is_winner?(result)
    if result.class == String
      puts "Vous vous êtes mutuellement coincés."
      victory_sound("What a bunch of losers ! It is a tie !")
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
    when "C" then type = "colonne"
    when "L" then type = "rangée"
    when "D" then type = "diagonale"
    end
    case victory[1]
    when "1" then rank = "première"
    when "2" then rank = "seconde"
    when "3" then rank = "troisième"
    end
    puts "#{winner.name} a triomphé en remplissant la #{rank} #{type}"
  end

  def blinking
    5.times do
      system("clear")
      sleep(0.1)
      refresh_grid
      sleep(0.1)
    end
  end

  def victory_sound(message)
    if OS.mac?
      system("say #{message}")
    else OS.linux?
      system("echo #{message}|espeak")
    end
  end

  def wanna_replay?
    while true
      puts "Ca en refait une chtite ma biche ? (y/n)"
      puts "(Par contre on change l'ordre de jeu !)"
      print "> "
      choice = gets.chomp
      if !choice.match?(/^y(es)?$/i) && !choice.match?(/^n(o)?$/i)
        puts "Merci de rentrer un choix correct gougnafier !"
      end
      break if choice.match?(/^y(es)?$/i) ||choice.match?(/^n(o)?$/i)
    end
    launch_replay if choice.match?(/^y(es)?$/i)
  end

  def launch_replay
    @board = Board.new
    @game_count += 1
    @switch = !@switch
    @switch ? perform_reverse : perform
  end
end
