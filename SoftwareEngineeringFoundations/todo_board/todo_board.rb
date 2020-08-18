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
            @lists[*args[0]].add_item(*args)
            return true
        when "up"
            @list.up(*args)
            return true
        when "down"
            @list.down(*args)
            return true
        when "swap"
            @list.swap(*args)
            return true
        when "sort"
            @list.sort_by_date!
            return true
        when "priority"
            @list.print_priority
            return true
        when "print"
            @list.print
            return true
        when "toggle"
            @list.toggle_item(*args)
            return true
        when "rm"
            @list.remove_item(*args)
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

todoboard = TodoBoard.new("Todos")
todoboard.run