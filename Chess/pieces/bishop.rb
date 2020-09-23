require_relative "./piece.rb"
require_relative ".././slideable.rb"
class Bishop < Piece
    include Slideable
    def move_dirs
        DIAGONAL_DIRS
    end

    def to_s
       "♝".colorize(@color)
    end

    def inspect
       "♝".colorize(@color)
    end
end