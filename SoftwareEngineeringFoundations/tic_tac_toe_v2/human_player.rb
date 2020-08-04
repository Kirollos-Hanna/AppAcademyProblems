class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        return @mark
    end

    def get_position
        p "Player " + @mark.to_s + ", enter a valid position ex. '0 0'"
        pos = gets.chomp
        arr = pos.split(" ").map(&:to_i)
        if arr.length != 2
            raise RuntimeError, "Invalid Position"
        end
        return arr
    end
end

# player = HumanPlayer.new(:X)
# p player.get_position