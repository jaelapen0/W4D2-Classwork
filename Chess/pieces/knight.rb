require_relative "./piece.rb"
require_relative ".././stepable.rb"
require "byebug"
class Knight < Piece
    include Stepable
    def move_dirs
        [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]
    end

     def to_s
       "♞".colorize(@color)
    end

    def inspect
       "♞".colorize(@color)
    end
end