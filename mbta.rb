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

        if start_line === end_line
            puts "Same Lines"
            s_station = start_line.stations.index { |x| x.name == start_station}
            e_station = end_line.stations.index { |x| x.name == end_station}
            (e_station - s_station).abs
        else
            puts "different Lines"
            s_station = start_line.stations.index { |x| x.name == start_station}
            s_p_station = start_line.stations.index { |x| x.name == "Park Street"}
            
            e_p_station = end_line.stations.index { |x| x.name == "Park Street"}
            e_station = end_line.stations.index { |x| x.name == end_station}            
            (e_p_station - e_station).abs + (s_p_station - s_station).abs

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
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6
