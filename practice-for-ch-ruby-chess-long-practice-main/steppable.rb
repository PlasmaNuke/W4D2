module Steppable

    def moves
        res = []
        x, y = pos

        move_diffs.each do |move_diff|
            dx, dy = move_diff

            new_pos = [x + dx, y + dy]

            next if !@board.valid_pos?(new_pos)

            piece = @board[new_pos]

            is_opp = !piece.empty? && piece.color != color

            res << new_pos if piece.empty? || is_opp
        end
        res
    end

    private

    def move_diffs
        raise NotImplimentedError
    end

end