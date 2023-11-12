require "byebug"
require_relative "piece"

module Slideable
    LATERAL_DIRS = [
        [0, 1], [1, 0],
        [-1, 0], [0, -1]
    ]
    DIAGONAL_DIRS = [
        [1, 1], [-1, -1],
        [1, -1], [-1, 1]
    ]

    def lateral_dirs
        LATERAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        res = []
        move_dirs.each do |dir|
            res += grow_unblocked_moves_in_dir(*dir)
        end
        res
    end

    private
    
    def move_dirs
        raise NotImplimentedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        x, y = pos
        blocked = false
        res = []

        while !blocked
            new_pos = [x + dx, y + dy]

            break if !@board.valid_pos?(new_pos)
                
            if @board[new_pos].empty?
                res << new_pos
            elsif @board[new_pos].color == @color
                blocked = true
            else
                res << new_pos
                blocked = true
            end
            x, y = new_pos
        end

        res
        
    end
end