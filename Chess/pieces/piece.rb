require_relative "board"

class Piece
    def initialize(pos) #(color, board, pos)
        # @color = color
        @board = board
        @pos = pos
    end
    
    def inspect
        :N
    end

    def valid_moves
        moves.select do |pos|
            row,col = pos
            row.between?(0,7) && col.between?(0,7)
        end
    end

    def pos=(val)
        
        @board[self.pos] = val
        # row,col = self.pos#.pos
        # @board[row][col] = self
    end
end