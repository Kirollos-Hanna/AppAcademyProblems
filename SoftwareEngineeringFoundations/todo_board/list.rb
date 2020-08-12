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
end

newList = List.new("First List")
p newList.size
p newList.add_item("t", "2020-1-10", "d")
p newList.size