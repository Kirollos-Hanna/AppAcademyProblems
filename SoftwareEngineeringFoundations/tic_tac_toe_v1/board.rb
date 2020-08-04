class Board
    def initialize
        @grid = [
            ['_', '_', '_'],
            ['_', '_', '_'],
            ['_', '_', '_']
        ]
    end

    def valid?(pos)
        return true if @grid[pos[0]][pos[1]]
        false
    end

    def empty?(pos)
        return true if @grid[pos[0]][pos[1]] == '_'
        false
    end

    def place_mark(pos,mark)
        if !self.valid?(pos) || !self.empty?(pos)
            raise RuntimeError, "Invalid Position"
        else
            @grid[pos[0]][pos[1]] = mark
        end
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            count = 0
            row.each do |elm|
                if elm == mark
                    count += 1
                end
            end
            if count >= 3
                return true
            end
        end
        false
    end

    def win_col?(mark)
        col = 0
        @grid.each do |row|
            count = 0
            (0...@grid.length).each do |i|
                if @grid[i][col] == mark
                    count += 1
                end
                if count >= 3
                    return true
                end
            end
            col += 1
        end
        false
    end

    def win_diagonal?(mark)
        @grid.each do |row|
            count = 0
            invCount = 0
            (0...@grid.length).each do |i|
                if @grid[i][i] == mark
                    count += 1
                end
                if @grid[-i-1][i] == mark
                    invCount += 1
                end
                if count >= 3 || invCount >= 3
                    return true
                end
            end
        end
        false
    end

    def win?(mark)
        if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.include?("_")
        end
        false
    end
end

# board = Board.new()
# p board.place_mark([1,1], :O)
# p board.place_mark([2,0], :O)
# p board.place_mark([2,1], :O)
# p board.place_mark([2,2], :O)
# p board.place_mark([1,0], :O)
# p board.place_mark([1,2], :O)
# p board.place_mark([0,1], :O)
# p board.place_mark([0,0], :O)
# p board.place_mark([0,2], :O)
# board.print
# p board.empty_positions?