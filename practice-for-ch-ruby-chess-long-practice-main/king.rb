require_relative "piece"
require_relative "steppable"

class King < Piece
    include Steppable

    MOVE_DIFFS = [
        [-1, -1], [-1, 1], [1, -1], [1, 1],
        [-1, 0], [0, -1], [1, 0], [0, 1]
    ]

    def symbol
        '♛'.colorize(color)
    end

    protected

    def move_diffs
        MOVE_DIFFS
    end
end