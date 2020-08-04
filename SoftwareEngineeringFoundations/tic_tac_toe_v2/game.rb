require_relative "board"
require_relative "human_player"

class Game
    def initialize(boardSize, *marks)
        @players = []
        marks.each do |mark|
            @players.push(HumanPlayer.new(mark))
        end
        @board = Board.new(boardSize)
        @currentPlayer = @players[0]
    end

    def switch_turn
        @players = @players.rotate
        @currentPlayer = @players[0]
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

game = Game.new(4, :X, :O, :Z)
game.play