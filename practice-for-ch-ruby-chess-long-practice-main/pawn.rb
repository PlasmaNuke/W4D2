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
            new_pos = [x + dx, y]
            res << new_pos if @board[new_pos].empty?
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
        dx = foward_dir

        [-1, 1].each do |dy|
            new_pos = [x + dx, y + dy]

            next if !@board.valid_pos?(new_pos)

            piece = @board[new_pos]

            is_opp = piece.color != color && !piece.empty?

            res << new_pos if is_opp
        end

        res
    end

end