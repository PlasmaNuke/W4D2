require_relative "null_piece"
require_relative "queen"
require_relative "king"
require_relative "rook"
require_relative "bishop"
require_relative "knight"
require_relative "pawn"
require "colorize"
require "byebug"

class Board

    attr_reader :rows

    def initialize(rows = nil)
        if rows.nil?
            populate
        else
            @rows = rows
        end
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        if piece.empty?
            raise "No piece at start position" 
        elsif !piece.moves.include?(end_pos)
            raise "Not a valid end position"
        else
            piece = self[start_pos]
            add_piece(NullPiece.instance, start_pos)
            add_piece(piece, end_pos)
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
        piece.pos = pos
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

    def populate
        @rows = Array.new(8) { Array.new(8) { NullPiece.instance }}
        [[0,0], [0,7]].each { |pos| self[pos] = Rook.new(:black, self, pos) }
        [[7,0], [7,7]].each { |pos| self[pos] = Rook.new(:white, self, pos) }
        [[0,1], [0,6]].each { |pos| self[pos] = Knight.new(:black, self, pos) }
        [[7,1], [7,6]].each { |pos| self[pos] = Knight.new(:white, self, pos) }
        [[0,2], [0,5]].each { |pos| self[pos] = Bishop.new(:black, self, pos) }
        [[7,2], [7,5]].each { |pos| self[pos] = Bishop.new(:white, self, pos) }
        self[[0,3]] = King.new(:black, self, [0,3])
        self[[0,4]] = Queen.new(:black, self, [0,4])
        self[[7,4]] = King.new(:white, self, [7,4])
        self[[7,3]] = Queen.new(:white, self, [7,3])
        (0..7).each do |y|
            self[[1, y]] = Pawn.new(:black, self, [1, y])
        end
        (0..7).each do |y|
            self[[6, y]] = Pawn.new(:white, self, [6, y])
        end
    end

    def dup
        new_rows = @rows.map { |row| row.map { |piece| piece.empty? ? piece : piece.dup }}
        Board.new(new_rows)
    end

end