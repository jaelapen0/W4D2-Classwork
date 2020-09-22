require_relative "piece.rb"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
    end

    def populate
        @grid.each_with_index do |row, outer_idx|
            if outer_idx == 0 || outer_idx == 7
                row.each_with_index do |ele, inner_idx|
                    @grid[outer_idx][inner_idx] = Piece.new([outer_idx, inner_idx])
                end
            end
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
        endpiece = self[end_pos]
        raise "End position cannot be reached" unless endpiece.nil?
        self[start_pos] = nil
        self[end_pos] = current_piece
    end
end