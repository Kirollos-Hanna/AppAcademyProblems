require_relative "item"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        begin
            newItem = Item.new(title,deadline,description)
            @items.push(newItem)
            return true
        rescue
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index >= 0 && index < @items.size
            return true
        end
        false
    end

    def swap(ind1, ind2)
        if self.valid_index?(ind1) && self.valid_index?(ind2)
            item1 = @items[ind1]
            item2 = @items[ind2]
            @items[ind1] = item2
            @items[ind2] = item1
            return true
        end
        return false
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]
    end
    
    def print
        p "Index Item Deadline Done"
        @items.each.with_index do |elm, i|
            p i.to_s + " " + elm.title + " " + elm.deadline + " " + elm.isDone.to_s
        end
    end

    def print_full_item(ind)
        if ind < @items.size
            p @items[ind].title + " " + @items[ind].deadline + " " + @items[ind].description + " " + @items[ind].isDone.to_s
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(ind, amount=1)
        item = nil
        if ind < @items.size
            item = @items[ind]
        end
        (1..amount).each do |i|
            currentInd = ind - i
            if currentInd < 0
                break
            end
            itemToGoDown = @items[currentInd]
            @items[currentInd] = item
            @items[currentInd+1] = itemToGoDown
        end
    end

    def down(ind, amount=1)
        item = nil
        if ind < @items.size
            item = @items[ind]
        end
        (1..amount).each do |i|
            currentInd = ind + i
            
            if currentInd+1 > @items.size
                break
            end

            itemToGoUp = @items[currentInd]
            @items[currentInd] = item
            @items[currentInd-1] = itemToGoUp
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(ind)
        @items[ind].toggle
    end

    def remove_item(ind)
        @items.delete_at(ind)
    end

    def purge
        i = 0
        while i < @items.size
            if @items[i].isDone
                self.remove_item(i)
                i -= 1
            end
            i += 1
        end
    end
end

list = List.new("Todos")
list.add_item("tit", "2010-1-10", "desc")
list.add_item("tat", "2010-1-12", "desc")
list.add_item("tot", "2010-1-15", "desc")
list.add_item("tut", "2010-1-14", "desc")
list.toggle_item(2)
list.toggle_item(0)
list.print
list.purge
list.print