class Player
  attr_reader :name, :symbol, :player_number

  @@symbols = ['😈', '👿', '👽', '🦄', '🍺', '😇', '😋', '😎', '😍', '❤️ ', '💀', '👻', '💩', '😍', '🖕', '⚔️ ', '💲', '♠️ ', '♣️ ', '♦️ ']
  @@taken_symbols = []

  def initialize(rank, player_number)
    @name = choose_name(rank)
    @symbol = choose_symbol
    @player_number = player_number
  end

  def play_move
    move = ""
    first_try = true

    until /^[abc][123]$/i.match(move)
      puts first_try ? "#{@name}, choisis ton coup" : "Mauvaises coordonnées.\nChoisis de nouveau"
      print "> "
      move = gets.chomp
      first_try = false
      puts "\n"
    end

    move.upcase
  end

  private

  def choose_name(rank)
    system('clear')
    puts "#{rank} joueur, indique ton nom ?"
    print '> '
    gets.chomp.capitalize
  end

  def symbol_menu
    puts "#{@name}, choisis ton symbole."
    @@symbols.length.times { |index| puts "#{index + 1} - #{@@symbols[index]}" }
    print '> '
    gets.chomp
  end

  def choose_symbol
    system('clear')
    choice_string = symbol_menu
    choice = choice_string.to_i

    while !choice_string.match(/^\d+$/) || choice <= 0 || choice > @@symbols.length
      puts 'Choix invalide !'
      choice_string = symbol_menu
      choice = choice_string.to_i
    end

    symbol = @@symbols[choice - 1]
    puts "Tu as choisi ce symbole : #{symbol}"
    STDIN.getc

    @@taken_symbols << @@symbols.delete(symbol)
    symbol
  end
end
