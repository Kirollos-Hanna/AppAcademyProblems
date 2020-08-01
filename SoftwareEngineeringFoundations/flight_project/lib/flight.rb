require_relative "passenger"

class Flight
    def initialize(flightNum, capacity)
        @flight_number = flightNum
        @capacity = capacity
        @passengers = []
    end

    def passengers
        return @passengers
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        false
    end

    def board_passenger(passenger)
        if !self.full?
            if passenger.has_flight?(@flight_number)
                @passengers.push(passenger)
            end
        end
    end

    def list_passengers
        newArr = []
        @passengers.each do |elm|
            newArr.push(elm.name)
        end
        newArr
    end

    def [](ind)
        return @passengers[ind]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end