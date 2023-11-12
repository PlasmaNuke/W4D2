require_relative "board"

class Game

    attr_reader :checkmate

    def initialize
        @player_1
        @player_2
        @current_player
        @board = Board.new
        @checkmate = false
    end

    def play

        while !checkmate
            
        end

    end

end