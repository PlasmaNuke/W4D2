require_relative "piece"

class King < Piece

    def symbol
        color == :white ? :♔ : :♚
    end

    protected

    def move_diffs
        
    end
end