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
            
            v_start = start_line.stations.index { |station| station.name == start_station}
            v_end = end_line.stations.index { |station| station.name == end_station}
        
        
        if start_line === end_line
            
            puts (v_end - v_start).abs
            # puts "Same Lines"
        else
            pa_start = start_line.stations.index { |station| station.name == "Park Street"}
            pa_end = end_line.stations.index { |station| station.name == "Park Street"}
            sub_pa = (v_start - pa_start).abs
            sub_pa2 = (v_end - pa_end)
            puts sub_pa + sub_pa2
            # puts "different Lines"
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
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6

