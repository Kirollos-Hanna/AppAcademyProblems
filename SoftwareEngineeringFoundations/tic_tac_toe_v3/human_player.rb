class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        return @mark
    end

    def get_position(legal_positions)
        p "Player " + @mark.to_s + ", enter a valid position ex. '0 0'"
        pos = gets.chomp
        arr = pos.split(" ").map(&:to_i)
        if !legal_positions.include?(arr)
            p arr.to_s + " is not a legal position"
            return self.get_position(legal_positions)
        end
        return arr
    end
end

# player = HumanPlayer.new(:X)
# positions = [[1, 2], [3, 4], [4, 3]]
# p player.get_position(positions)