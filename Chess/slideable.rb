module Slideable
    DIAGONAL_DIRS =  [ [1,1], [-1,1], [1,-1], [-1,-1] ]
    HORIZONTAL_DIRS = [ [0,1], [0,-1], [1,0], [-1,0] ]

    def moves
        row, col = self.pos
        pos_moves = []
        move_dirs.each do |dir|
            dir_row, dir_col = dir
            pos_moves += grow_unblocked_moves_in_dir(dir_row,dir_col)
        end
        pos_moves
    end

    private
    def grow_unblocked_moves_in_dir(dx,dy)
        list_of_moves = []
        current_pos = @pos.dup
        current_row, current_col = current_pos
        while current_row.between(0,7) && current_col.between(0,7)
            
            current_row, current_col = current_pos
            current_pos[0] += dx
            current_pos[1] += dy
            
            pos_piece =  @board[current_pos]
            if pos_piece.color == self.color
                break
            elsif pos_piece.color.nil?
                list_of_moves << current_pos
            else
                list_of_moves << current_pos
                break
            end
            
        end
        list_of_moves
    end
    
end