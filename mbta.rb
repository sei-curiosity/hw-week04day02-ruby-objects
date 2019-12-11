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
       l1=start_line.stations.map{|k| k.name }
    l2=end_line.stations.map{|k| k.name}
    # start_station = instance_variable_get("@#{start_line.downcase}")
    # end_station = instance_variable_get("@#{end_line.downcase}")
        
        if (start_station == end_station && start_line == end_line) 
      
            return 0
    
    elsif start_line == end_line
        # p start_line.@stations.index(start_station)
        # p "second else"
        (l1.index(start_station) - l1.index(end_station)).abs 
        else
            (l1.index(start_station) - l1.index("Park Street")).abs +  (l2.index(end_station) - l2.index("Park Street")).abs
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
puts mbta.stops_between_stations('red', 'Alewife', 'Red', 'Alewife')
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Kendall') 
puts mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')
puts mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station')
