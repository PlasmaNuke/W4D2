require_relative "cursor"
require "colorize"

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        @board.rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                color = nil
                if @board[[i, j]].empty?
                   if (i + j).even? 
                        color = :white
                   else
                        color = :black
                   end
                else
                    color = @board[[i, j]].color
                end
                print @board[[i, j]].to_s.colorize(color)
            end
            print "\n"
        end
    end
end