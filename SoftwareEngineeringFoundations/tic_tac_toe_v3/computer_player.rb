require_relative "board"

class ComputerPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        return @mark
    end

    def get_position(legal_positions)
        legal_positions.sample
    end
end

# comPlayer = ComputerPlayer.new(:X)

# positions = [[1, 2], [3, 4], [4, 3]]
# p comPlayer.get_position(positions)