class Board
  attr_reader :boxes

  def initialize
    @boxes = [
    [0,0,0],
    [0,0,0],
    [0,0,0]
  ]
  end

  def check_for_end_of_game
    #check lines
    @boxes.each_with_index do |line,i|
      return ["P1","L#{i+1}"] if line[0] == 1 && line[1]==1 && line [2]==1
      return ["P2","L#{i+1}"] if line[0] == 2 && line[1]==2 && line [2]==2
    end
    #check columns
    return ["P1","C1"]if @boxes[0][0] == 1 && @boxes[1][0] == 1 && @boxes[2][0] == 1
    return ["P2","C1"]if @boxes[0][0] == 2 && @boxes[1][0] == 2 && @boxes[2][0] == 2
    return ["P1","C2"]if @boxes[0][1] == 1 && @boxes[1][1] == 1 && @boxes[2][1] == 1
    return ["P2","C2"]if @boxes[0][1] == 2 && @boxes[1][1] == 2 && @boxes[2][1] == 2
    return ["P1","C3"]if @boxes[0][2] == 1 && @boxes[1][2] == 1 && @boxes[2][2] == 1
    return ["P2","C3"]if @boxes[0][2] == 2 && @boxes[1][2] == 2 && @boxes[2][2] == 2
    #check diagonals
    return ["P1","D1"]if @boxes[0][0] == 1 && @boxes[1][1] == 1 && @boxes[2][2] == 1
    return ["P2","D1"]if @boxes[0][0] == 2 && @boxes[1][1] == 2 && @boxes[2][2] == 2
    return ["P1","D2"]if @boxes[0][2] == 1 && @boxes[1][1] == 1 && @boxes[2][0] == 1
    return ["P2","D2"]if @boxes[0][2] == 2 && @boxes[1][1] == 2 && @boxes[2][0] == 2
    #check for draw
    draw = true
    @boxes.each do |line| line.each{ |box| draw = false if box==0} end
      return "draw" if draw == true
      #if nothing return nul
      return
    end


    def play(_player_number, _move)
      @boxes[_move[0]][_move[1]] = _player_number
    end

    def convert_move(_move)
      case _move[0]
      when "A"
        line = 0
      when "B"
        line = 1
      when "C"
        line = 2
      end
      col = _move[1].to_i - 1
      [line,col]
    end

    def cell_is_empty?(_move)
      @boxes[_move[0]][_move[1]] == 0
    end


end
