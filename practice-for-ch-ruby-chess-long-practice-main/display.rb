require_relative "cursor"

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        @board.rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if @board[[i, j]].empty?
                   if (i + j).even? 
                        print @board[[i, j]].to_s.colorize(:white)
                   else
                        print @board[[i, j]].to_s.colorize(:black)
                   end
                else
                    print @board[[i, j]].to_s
                end
            end
            print "\n"
        end
    end
end