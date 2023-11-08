require_relative "null_piece"
require_relative "piece"
require_relative "queen"

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) { nil }}
        # @null_piece = NullPiece.new
    end

    def move_piece!(start_pos, end_pos)
        if self[start_pos].nil?
            raise "No piece at start position" 
        elsif !valid_pos?(end_pos)
            raise "Not a valid end position"
        else
            piece = self[start_pos]
            piece.pos = end_pos
            self[start_pos] = nil
            self[end_pos] = piece
        end
    end

    def []=(pos, piece)
        x, y = pos
        @rows[x][y] = piece
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def valid_pos?(pos)
        pos.all? { |idx| idx >= 0 && idx < @rows.size }
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)

    end

    def in_check?(color)
        king_pos = find_king(color)
        @rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                return true if piece.color != color && piece.moves.include?(king_pos)
            end
        end
        false
    end

    def find_king(color)
        @rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                return [i, j] if self[[i, j]].is_a?(King) && self[[i, j]].color == color
            end
        end
    end

end