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
       
        startStationIndex = start_line.stations.find_index {|x| x.name == start_station }
        endStationIndex =end_line.stations.find_index {|station| station.name == end_station }

        if start_line == end_line 
                
            stop_time =  startStationIndex - endStationIndex
             (stop_time).abs
# 
        else
            # different Lines
            tartLineParkStreetIndex = start_line.stations.find_index {|x| x.name ==  "Park Street"}
            tripToParkStreet = (startStationIndex - tartLineParkStreetIndex).abs
            endLineParkStreetIndex = end_line.stations.find_index {|station| station.name == "Park Street" }
            tripToDestination = (endStationIndex - endLineParkStreetIndex).abs
            totalTrip =tripToParkStreet + tripToDestination
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
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') 
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station')
p mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')
