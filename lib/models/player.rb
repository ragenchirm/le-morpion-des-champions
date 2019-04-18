class Player
  attr_reader :name, :symbol
  attr_accessor :moves

  @@symbols = ['X', 'O', '+', '$', '€', '%', '@']
  @@taken_symbols = []

  def initialize
    @name = choose_name
    @symbol = choose_symbol
    @moves = []

  end

  def choose_name
    system('clear')
    puts 'Indique ton nom ?'
    print "> "
    gets.chomp.capitalize
  end

  def choose_symbol
    system('clear')
    puts "#{@name}, choisis ton symbole."
    @@symbols.length.times { |index| puts "#{index} - #{@@symbols[index]}" }
    print "> "
    symbol = gets.chomp

    @@taken_symbols << symbol
  end

  #def play
  #end
end