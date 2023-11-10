module Steppable

    def moves
        res = []
        x, y = pos

        move_diffs.each do |move_diff|
            dx, dy = move_diff
            new_pos = [x + dx, y + dy]
            res << new_pos if @board.valid_pos?(new_pos)
        end
        res
    end

    private

    def move_diffs
        raise NotImplimentedError
    end

end