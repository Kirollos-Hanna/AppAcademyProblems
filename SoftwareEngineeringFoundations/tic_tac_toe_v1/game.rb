require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark1, mark2)
        @playerOne = HumanPlayer.new(mark1)
        @playerTwo = HumanPlayer.new(mark2)
        @board = Board.new
        @currentPlayer = @playerOne
    end

    def switch_turn
        if @currentPlayer == @playerOne
            @currentPlayer = @playerTwo 
        else
            @currentPlayer = @playerOne
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position
            @board.place_mark(pos, @currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                p "Victory"
                return 
            else
                self.switch_turn
            end
        end
        p "Draw"
    end
end

game = Game.new(:X, :O)
game.play