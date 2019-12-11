class Subway
    attr_reader :red, :green
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

        index_start_station = start_line.stations.index  { |station| station.name == start_station}
        index_end_station = end_line.stations.index { |station| station.name == end_station}

        if start_line === end_line
            return (index_start_station - index_end_station).abs
        else
            index_park_start = start_line.stations.index { |station| station.name == "Park Street"}
            index_park_end = end_line.stations.index { |station| station.name == "Park Street"}
            stops_first_line = (index_start_station - index_park_start).abs
            stops_second_line = (index_end_station - index_park_end).abs
            return stops_first_line + stops_second_line
        end

        
    end
end
    
# One line, all the stations on that line
class Line
    attr_reader :name, :stations
    def initialize(name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station)}
    end
end
  
# One station
class Station
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

mbta = Subway.new

puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6  
