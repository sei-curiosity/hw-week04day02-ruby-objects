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
        start_station_index = start_line.stations.index("start_station")
        end_station_index = end_line.stations.index("end_station")
        ps_index_start_line = start_line.stations.index("Park Street")
        ps_index_end_line = end_line.stations.index("Park Street")
        # puts start_line.stations[0].name
       
        if start_line === end_line
            dif = (end_station_index - start_station_index).abs
            puts "#{dif} stops"
            # puts "Same Lines"

        else
            diff_x = (ps_index_start_line - start_station_index).abs 
            diff_y = (ps_index_end_line - end_station_index).abs 
            diff = diff_x + diff_y
            puts "#{diff} stops"
            # puts "different Lines"
        end

    end

end
 ##########   
class Line
    attr_reader :stations, :name

    def initialize(name, stations)
        @name = name
        @@stations = stations.map { |station| Station.new(station)}
    end

end
 
###########

class Station
    attr_reader :name

    def initialize(name)
        @name = name
    end

end

# 
mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife')
# stat = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
# puts Line.initialize.stations