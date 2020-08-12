class Item

    attr_accessor :title, :deadline, :description
    
    def self.valid_date?(dateStr)
        dateArr = dateStr.split("-")
        dateArr.each_with_index do |elm, i|
            if i == 0 && !elm.size == 4
                return false
            elsif i == 1 && !(1..12).include?(elm.to_i)
                return false
            elsif i == 2 && !(1..31).include?(elm.to_i)
                return false
            end
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise RuntimeError, "Invalid date"
        end
        @description = description
    end

end
