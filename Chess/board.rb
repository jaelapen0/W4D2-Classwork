require_relative "piece.rb"
require "byebug"
class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
    end

    def populate
        @grid.each_with_index do |row, oi|
            #row.each_with_index do |ele, ii|
               # pos = [oi, ii]
                if oi.between?(2,5)
                    @grid[oi] = fill_null_row(oi)
                elsif oi == 0
                    @grid[0] = fill_back_row(:black, oi)
                elsif oi == 7
                    @grid[7] = fill_back_row(:white, oi)
                elsif oi == 1
                    @grid[1] =  fill_front_row(:black, oi)
                elsif oi == 6
                    @grid[6] =  fill_front_row(:white, oi)
                end
            #end
        end
    end

    def fill_back_row(color, row_i)
        [
        Rook.new(color,self,[row_i,0]),
        Knight.new(color,self,[row_i,1]),
        Bishop.new(color,self,[row_i,2]),
        Queen.new(color,self,[row_i,3]),
        King.new(color,self,[row_i,4]),
        Bishop.new(color,self,[row_i,5]),
        Knight.new(color,self,[row_i,6]),
        Rook.new(color,self,[row_i,7])
      ]
    end

    def fill_null_row(row_i)
        (0..7).to_a.map do |col_i|
            NullPiece.instance
        end
    end

    def fill_front_row(color, row_i)
        (0..7).to_a.map do |col_i|
            Pawn.new(color, self, [row_i,col_i])
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        current_piece = self[start_pos]
        raise "No piece at #{start_pos}" unless current_piece.is_a?(Piece)
        end_piece = self[end_pos]
        raise "End position cannot be reached" unless end_piece.is_a?(NullPiece)
        current_piece.pos = end_pos.dup
        # end_piece.pos = start_pos.dup
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
end