module Stepable
    def moves
        row, col = self.pos
        pos_moves = []
        move_dirs.each do |dir|
            dir_row, dir_col = dir
            pos_moves += [dir_row + row, dir_col + col]
        end
        pos_moves
    end
end