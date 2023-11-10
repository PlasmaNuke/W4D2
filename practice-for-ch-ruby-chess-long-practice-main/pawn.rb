require_relative "piece"

class Pawn < Piece

    def symbol
        '♟'.colorize(color)
    end

    def moves
        res = []
        x, y = pos
        dy = foward_dir

        if at_start_row?
            2.times do
                new_pos = [x, y + dy]
                res << new_pos if @board.valid_pos?(new_pos) && @board[new_pos].empty?
                x, y = new_pos
            end
        else
            res << [x, y + dy]
        end
        res + side_attacks
    end

    private

    def at_start_row?
        color == :black ? pos[1] == 1 : pos[1] == 6
    end

    def foward_dir
        color == :white ? -1 : 1
    end

    def side_attacks
        res = []
        x, y = pos
        dy = foward_dir

        [-1, 1].each do |dx|
            new_pos = [x + dx, y + dy]
            res << new_pos if @board.valid_pos?(new_pos) && !@board[new_pos].empty? && @board[new_pos].color != color
        end

        res
    end

end