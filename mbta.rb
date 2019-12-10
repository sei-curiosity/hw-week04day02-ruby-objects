class Line
    attr_reader :stations, :name

    def initialize(name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station)}
    end

end
 
class Stations
    attr_reader :name

    def initialize(name)
        @name = name
    end

end

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

        if start_line === end_line

            puts "Same Lines"
            start_line_location = start_line.stations.find_index{|i| i.name == start_station}
            end_line_location = end_line.stations.find_index{|j| j.name == end_station}
            
            puts location1 = start_line_location - end_line_location 

            
        else
            puts "Different Lines"

            start_station_location = start_line.stations.find_index{|x| x.name == start_station}
            end_station_location = end_line.stations.find_index{|o| o.name == end_station}
            
            puts location2 = end_station_location - start_station_location

        end

    end

end
    
# 



mbta = Subway.new

mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')# 6