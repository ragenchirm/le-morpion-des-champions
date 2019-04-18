class Player
  attr_reader :name, :symbol
  attr_accessor :moves

  @@symbols = []
  @@taken_symbols = []

  def initialize
    @name = choose_name
    @symbol = choose_symbol
    @moves = []
    @@taken_symbols << @symbol
  end

  def choose_name
    "Sed"
  end

  def choose_symbol
    ":)"
  end

  #def play
  #end
end