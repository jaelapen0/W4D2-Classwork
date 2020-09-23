require_relative "./piece.rb"
require_relative ".././stepable.rb"
class King < Piece
    include Stepable
    def move_dirs
        [[0,1], [0,-1], [1,0], [-1,0], [1,1], [-1,-1], [1,-1], [-1,1]]
    end

    def to_s
      "♚".colorize(@color)
    end

    def inspect
      "♚".colorize(@color)
    end
end