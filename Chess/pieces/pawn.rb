require_relative "./piece.rb"

require "byebug"
class Pawn < Piece
    attr_reader :init_pos
    def initialize(color, board, pos)
        super(color, board, pos)
        @init_pos = pos
    end

    def moves
        forward_steps + side_attacks
    end

    def to_s
       "♟".colorize(@color)
    end

    def inspect
       "♟".colorize(@color)
    end

    private
    def forward_dir
        self.color == :black ? 1 : -1 
    end

    def forward_steps
        f_steps = []
        # one_step = [self.pos[0], self.pos[1] + forward_dir]
        # two_steps = [self.pos[0], self.pos[1] + (forward_dir * 2)]
        one_step = [self.pos[0] + forward_dir, self.pos[1]]
        two_steps = [self.pos[0] + (forward_dir * 2), self.pos[1]]
        f_steps << one_step if @board[one_step].is_a?(NullPiece)
        # debugger
        f_steps << two_steps if @board[two_steps].is_a?(NullPiece) && self.pos == @init_pos
        f_steps
    end

    def opposite_color
        self.color == :black ? :white : :black
    end

    def side_attacks
        attacks = []
        # left_attack = [self.pos[0] - 1, self.pos[1] + forward_dir ]
        # right_attack = [self.pos[0] + 1, self.pos[1] + forward_dir ]
        left_attack = [self.pos[0] + forward_dir, self.pos[1] - 1]
        right_attack = [self.pos[0] + forward_dir, self.pos[1] + 1]
        attacks << left_attack if !@board[left_attack].is_a?(NullPiece) && @board[left_attack].color == opposite_color
        attacks << right_attack if !@board[right_attack].is_a?(NullPiece) && @board[right_attack].color == opposite_color
        attacks
    end 
end