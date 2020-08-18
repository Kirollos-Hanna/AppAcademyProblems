require_relative "list"

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, target, *args = gets.chomp.split(' ')

        case cmd
        when "mklist"
            @lists[target] = List.new(target)
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
            @lists[target].add_item(*args.map(&:to_i))
            return true
        when "up"
            @lists[target].up(*args.map(&:to_i))
            return true
        when "down"
            @lists[target].down(*args.map(&:to_i))
            return true
        when "swap"
            @lists[target].swap(*args.map(&:to_i))
            return true
        when "sort"
            @lists[target].sort_by_date!
            return true
        when "priority"
            @lists[target].print_priority
            return true
        when "print"
            if args.empty?
                @lists[target].print
            else
                @lists[target].print_full_item(*args[0].to_i)
            end
            return true
        when "toggle"
            @lists[target].toggle_item(*args[0].to_i)
            return true
        when "purge"
            @lists[target].purge
            return true
        when "rm"
            @lists[target].remove_item(*args[0].to_i)
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