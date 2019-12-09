class Subway
    def initialize
      @stations = { "Red" => Line.new(["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"]),
                    "Green" =>  Line.new(["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"]),
                    "Orange" => Line.new(["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"])
                    }
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        num = 0
        if start_line == end_line
            num += @stations[start_line].stops_between_stations(start_station, end_station)
        else
            num += @stations[start_line].stops_between_stations(start_station, "Park Street")
            num += @stations[end_line].stops_between_stations("Park Street", end_station)
        end
    end
end

# One line, all the stations on that line
class Line
    def initialize(arr)
        @stations = []
        arr.each do |station|
            @stations.push(Station.new(station, arr.index(station)))
        end
    end

    def stops_between_stations(start_station,end_station)
        num1 = 0
        num2 = 0

        @stations.each do |station|
            num1 = station.number if start_station == station.name
            num2 = station.number if end_station == station.name
        end
        (num1-num2).abs
    end
end

# One station
class Station
    attr_reader :name
    attr_reader :number
    def initialize(name,number)
        @name = name
        @number = number
    end
end


mbta = Subway.new
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6