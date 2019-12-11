class Subway
    attr_reader :red, :green, :orange

    def initialize
        @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
        @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
        @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end


    def stops_between_stations(start_line, start_station, end_line, end_station)
        start_line = instance_variable_get("@#{start_line.downcase}") 
        end_line = instance_variable_get("@#{end_line.downcase}")

            g_line = start_line.stations.index { |station| station.name == start_station }
            d_line = end_line.stations.index { |station| station.name == end_station}
            if start_line === end_line
            puts "Same Line"
            (gd_line = g_line - d_line)
            
        else
            puts "different Lines"
            park_st_t = start_line.stations.index { |station| station.name == "Park Street"}
            park_ed_d = end_line.stations.index { |station| station.name == "Park Street"}
            count1way = (g_line - park_st_t).abs
            count2way = (d_line - park_ed_d).abs
           puts all_way = count1way + count2way
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

puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife').abs # 0
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Hynes') # 6