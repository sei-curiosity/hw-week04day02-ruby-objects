class Subway
    attr_reader :red, :green, :orange

    def initialize
        @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
        @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
        @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        # Convert string to instance variable
        # https://stackoverflow.com/questions/29410143/convert-string-to-instance-variables
        start_line = instance_variable_get("@#{start_line.downcase}")
        end_line = instance_variable_get("@#{end_line.downcase}")

        if start_line == end_line
            abs_value = start_line.stations.find_index { |station| station.name == start_station } - 
            end_line.stations.find_index { |station| station.name == end_station}
            abs_value.abs
        else
            pos = start_line.stations.find_index { |station| station.name == start_station} - start_line.stations.find_index { |station| station.name == "Park Street"}
            nig = end_line.stations.find_index { |station| station.name == end_station} - end_line.stations.find_index { |station| station.name == "Park Street"}
            sum = pos.abs + nig.abs
        end

    end

end
    
class Line
    attr_reader :stations, :name

    def initialize(name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station)}
    end

end
 

class Station
    attr_reader :name

    def initialize(name)
        @name = name
    end

end

mbta = Subway.new
puts mbta.stops_between_stations('Red', 'South Station', 'green', 'Kenmore')
