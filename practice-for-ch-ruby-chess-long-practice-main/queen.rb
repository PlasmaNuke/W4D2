require_relative "slideable"
require_relative "piece"

class Queen < Piece
    include Slideable

    def symbol
        '♛'.colorize(color)
    end

    private

    def move_dirs
        lateral_dirs + diagonal_dirs
    end

end