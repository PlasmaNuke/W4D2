require_relative "cursor"
require_relative "board"
require "colorize"

class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
        @selected_pos
        @error_message = nil
        while true
            render
            # input = cursor.get_input
            # if !!input && !@selected_pos
            #     @selected_pos = input
            #     @error_message = nil
            # elsif !!input
            #     board.move_piece(@selected_pos, input)
            #     @selected_pos = nil
            #     @error_message = nil
            # end
            get_input   
        end
    end

    def render
        system('clear')
        @board.rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                color = nil

                piece = @board[[i, j]]

                if piece.empty?
                   if (i + j).even? 
                        color = :white
                   else
                        color = :black
                   end
                else
                    color = piece.color
                end

                color = :yellow if [i, j] == cursor.cursor_pos

                if !!@selected_pos && !@board[@selected_pos].empty?
                    if @board[@selected_pos].moves.include?([i, j])
                        if [i, j] == cursor.cursor_pos 
                            color = :green
                        else
                            color = :blue
                        end
                    end
                end

                color = :red if [i, j] == @selected_pos

                print @board[[i, j]].to_s.colorize(color)
            end
            print "\n"
        end
        puts @error_message if !!@error_message
    end

    def get_input
        input = cursor.get_input
        if !!input && !@selected_pos
            @selected_pos = input
            @error_message = nil
        elsif !!input
            if input == @selected_pos
                @selected_pos = nil
            else
                board.move_piece(@selected_pos, input)
                @selected_pos = nil
                @error_message = nil
            end
        end
    rescue => e
        @error_message = e.message
        puts @error_message
        retry 
    end
end  

display = Display.new(Board.new)