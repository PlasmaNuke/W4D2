require_relative "board"

class Piece

    attr_writer :pos
    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        return true if @board[pos] == nil
        false
    end

    def symbol
        self.symbol
    end

    def to_s
        self.symbol.to_s
    end

    def move_into_check?(end_pos)
     
    end
end