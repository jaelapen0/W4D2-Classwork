#require_relative ".././board.rb"
require "colorize"
require "byebug" 
class Piece
    attr_reader :board, :color, :pos
    attr_accessor :pos

    def initialize (color=nil, board=nil, pos=nil)
        @color = color
        @board = board
        @pos = pos
    end
    
    def inspect
        :N
    end

    def valid_moves
       
    end

    # def pos=(val)
    #     debugger
    #     @board[self.pos].pos = val
    #     debugger
    #     @pos = val
    #     # row,col = self.pos#.pos
    #     # @board[row][col] = self
    # end
end