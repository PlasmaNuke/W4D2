require_relative "piece"

class Pawn < Piece

    def symbol
        '♟'.colorize(color)
    end

    def moves
        res = []
        x, y = pos
        dx = foward_dir

        if at_start_row?
            2.times do
                new_pos = [x + dx, y]
                if @board.valid_pos?(new_pos) && @board[new_pos].empty?
                    res << new_pos 
                else
                    return res + side_attacks
                end
                x, y = new_pos
            end
        else
            res << [x + dx, y] if @board.valid_pos?(new_pos) && @board[new_pos].empty?
        end
        res + side_attacks
    end

    private

    def at_start_row?
        pos[0] == 1 || pos[0] == 6
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
            res << new_pos if @board.valid_pos?(new_pos) && (@board[new_pos].empty? || @board[new_pos].color != color)
        end

        res
    end

end