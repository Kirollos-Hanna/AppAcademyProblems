class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        return @name
    end

    def has_flight?(flightNum)
        if @flight_numbers.include?(flightNum.upcase)
            return true
        end
        false
    end

    def add_flight(flightNum)
        if !has_flight?(flightNum)
            @flight_numbers.push(flightNum.upcase)
        end
    end
end