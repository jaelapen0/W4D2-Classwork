module Slideable
    DIAGONAL_DIRS =  = (-7..7).map { |i| [i,i] }
    VERTICAL_DIRS = (-7..7).map { |i| [0,i] }
    HORIZONTAL_DIRS = (-7..7).map { |i| [i,0] }

    def moves
        #change_pos = Proc.new{|dir| [row + dir[0], col + dir[1]]}
        row, col = self.pos
        pos_moves = []
        diagonal_moves = DIAGONAL_DIRS.map { |dir| [row+dir[0]], col + dir[1]] }
        vertical_moves = VERTICAL_DIRS.map { |dir| [row+dir[0]], col + dir[1]] }
        horizontal_moves = HORIZONTAL_DIRS.map { |dir| [row+dir[0]], col + dir[1]] }
    end

    
end