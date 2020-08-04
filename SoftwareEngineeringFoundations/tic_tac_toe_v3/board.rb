class Board
    def initialize(n)
        @grid = []
        (0..n).each do |i|
            @grid.push(Array.new(n, "_"))
        end
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
                else
                    count = 0
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
                else
                    count = 0
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
        (0...@grid.length).each do |i|
            count = 0
            invCount = 0
            (0..i).each do |j|
                k = i - j
                if @grid[k][j] == mark
                    count += 1
                else
                    count = 0
                end
                if @grid[-k-1][j] == mark
                    invCount += 1
                else
                    invCount = 0
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

    def legal_positions
        emptyPositions = []
        @grid.each.with_index do |row, i|
            row.each.with_index do |elm, j|
                if elm == "_"
                    emptyPositions.push([i,j])
                end
            end
        end
        emptyPositions
    end
end

# board = Board.new(4)
# p board.place_mark([0,3], :O)
# p board.place_mark([1,2], :O)
# p board.place_mark([2,1], :O)
# p board.place_mark([2,2], :O)
# p board.place_mark([1,1], :O)
# p board.place_mark([2,0], :O)
# p board.place_mark([3,0], :O)
# p board.place_mark([0,0], :O)
# p board.place_mark([0,2], :O)
# board.print
# p board.legal_positions
# p board.empty_positions?