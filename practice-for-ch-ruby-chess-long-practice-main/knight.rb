require "piece"
require "steppable"

class Knight < Piece
    include Steppable

    MOVE_DIFFS = [
        [-2, -1], [-1, -2],
        [1, -2], [-2, 1], 
        [2, -1], [-1, 2], 
        [1, 2], [2, 1]
    ]
    
    def symbol
        '♞'.colorize(color)
    end

    private
    
    def move_diffs
        MOVE_DIFFS
    end
end