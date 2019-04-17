class Displayer
  attr_reader :grid, :morpion_tab

  def initialize
    @morpion_tab = [[" "," "," "],[" "," "," "],[" "," "," "]]
    actualize_grid
  end

  def actualize_grid
    @grid = []
    @grid << "==============================="
    @grid << "||    == SUPER MORPION ==    ||"
    @grid << "|| Le Morpion des champions !||"
    @grid << "============================="
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

  def display_grid(_morpion_tab = @morpion_tab)
    @morpion_tab = _morpion_tab
    actualize_grid
    puts @grid

  end

end
