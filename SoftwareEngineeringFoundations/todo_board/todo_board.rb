require_relative "list"

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when "mklist"
            @lists[*args] = List.new(*args)
            return true
        when "ls"
            @lists.each do |key, val|
                p key
            end
            return true
        when "showall"
            p @lists
            return true
        when "mktodo"
            @lists[*args[0]].add_item(*args[1..-1])
            return true
        when "up"
            @lists[*args[0]].up(*args[1..-1])
            return true
        when "down"
            @lists[*args[0]].down(*args[1..-1])
            return true
        when "swap"
            @lists[*args[0]].swap(*args[1..-1])
            return true
        when "sort"
            @lists[*args[0]].sort_by_date!
            return true
        when "priority"
            @lists[*args[0]].print_priority
            return true
        when "print"
            @lists[*args[0]].print
            return true
        when "toggle"
            @lists[*args[0]].toggle_item(*args[1..-1])
            return true
        when "purge"
            @lists[*args[0]].purge
            return true
        when "rm"
            @lists[*args[0]].remove_item(*args[1..-1])
            return true
        when "quit"
            return false
        else
            print "Sorry, that command is not recognized."
        end
    end

    def run
        while true
            if !self.get_command
                break
            end
        end
    end

end

todoboard = TodoBoard.new()
todoboard.run