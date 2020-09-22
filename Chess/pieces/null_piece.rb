require_relative "piece.rb"
class NullPiece < Piece
    def initialize(board, pos)
        super(nil, board, pos)
        
    end
end