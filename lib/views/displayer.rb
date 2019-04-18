class Displayer
  attr_reader :grid, :morpion_tab, :cartouche, :symbol1, :symbol2

  def initialize
    @morpion_tab = [[" "," "," "],[" "," "," "],[" "," "," "]]
    @cartouche = cartouche
    actualize_grid
  end

  def cartouche
    @cartouche = Array.new
    @cartouche << "==============================="
    @cartouche << "||    == SUPER MORPION ==    ||"
    @cartouche << "|| Le Morpion des champions !||"
    @cartouche << "==============================="
  end

  def welcome
    system("clear")
    puts @cartouche
    puts "\n\n"
    puts "Bienvenue chez le Morpion des Gones -ades"
    puts "Cela ne vous dirait pas de vous gratter en couple."
    STDIN.getc
  end

  def actualize_grid
    @grid = []
    @grid << @cartouche
    @grid << "        1     2     3"
    @grid << "      _________________"
    @grid << "    ||     |     |     ||"
    @grid << " A  ||  #{@morpion_tab[0][0]}  |  #{@morpion_tab[0][1]}  |  #{@morpion_tab[0][2]}  ||"
    @grid << "    ||_____|_____|_____||"
    @grid << "    ||     |     |     ||"
    @grid << " B  ||  #{@morpion_tab[1][0]}  |  #{@morpion_tab[1][1]}  |  #{@morpion_tab[1][2]}  ||"
    @grid << "    ||_____|_____|_____||"
    @grid << "    ||     |     |     ||"
    @grid << " C  ||  #{@morpion_tab[2][0]}  |  #{@morpion_tab[2][1]}  |  #{@morpion_tab[2][2]}  ||"
    @grid << "    ||_____|_____|_____||"
  end

  def convert
    @morpion_tab.map! do |line|
      line.map! do |cell|
        case cell
        when 0
          cell = " "
        when 1
          cell = @symbol1
        when 2
          cell = @symbol2
        end
      end
    end
  end

  def display_grid(_morpion_tab = @morpion_tab)
    @morpion_tab = _morpion_tab
    convert
    actualize_grid
    puts @grid
  end

  def get_symbols(symbol1, symbol2)
    @symbol1 = symbol1
    @symbol2 = symbol2
  end
end
