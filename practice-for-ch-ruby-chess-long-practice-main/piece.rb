require "colorize"

class Piece

    attr_writer :pos
    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        return true if self.is_a?(NullPiece)
        false
    end

    def symbol
        self.symbol
    end

    def to_s
        # self.symbol.to_s
        " #{symbol} "
    end

    def move_into_check?(end_pos)
        
    end
end