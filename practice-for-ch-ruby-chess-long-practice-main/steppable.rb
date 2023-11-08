module Steppable

    def moves
        res = []
        x, y = pos

        move_diffs.each do |move_diff|
            dx, dy = move_diff
            res << [x + dx, y + dy]
        end
        res
    end

    private

    def move_diffs
        raise NotImplimentedError
    end

end