require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(boardSize, *marks)
        @players = []
        marks[0].each do |mark, bol|
            if bol
                @players.push(ComputerPlayer.new(mark))
            else
                @players.push(HumanPlayer.new(mark))
            end
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
            p " "
            pos = @currentPlayer.get_position(@board.legal_positions)
            @board.place_mark(pos, @currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                @board.print
                p "Player " + @currentPlayer.mark.to_s + "'s Victory"
                return 
            else
                self.switch_turn
            end
        end
        p "Draw"
    end
end

machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play