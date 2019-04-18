class Player
  attr_reader :name, :symbol
  attr_accessor :moves

  @@symbols = ['X', 'O', '+', '$', '€', '%', '@', '😈', '👿', '👽', '🦄', '🍺', '😇', '😋', '😎', '😍']
  @@taken_symbols = []

  def initialize
    @name = choose_name
    @symbol = choose_symbol
    @moves = []

  end
  
  def self.clear_symbols
    @@taken_symbols = []
  end

  def put_back_symbols_available_symbols
    @@symbols << @@taken_symbols.delete(@symbol)
  end

  private

  def choose_name
    system('clear')
    puts 'Indique ton nom ?'
    print "> "
    gets.chomp.capitalize
  end

  def symbol_menu
    puts "#{@name}, choisis ton symbole."
    @@symbols.length.times { |index| puts "#{index + 1} - #{@@symbols[index]}" }
    print "> "
    gets.chomp
  end

  def choose_symbol
    system('clear')
    choice_string = symbol_menu
    choice = choice_string.to_i
    
    while !choice_string.match(/^\d+$/) || choice <= 0 || choice > @@symbols.length
      puts "Choix invalide !"
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