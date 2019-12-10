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
        start_s =  start_line.stations.index {|starts| starts.name == start_station} 
        end_s =  end_line.stations.index {|ends| ends.name == end_station} 
        if start_line === end_line
            total = end_s - start_s
             total.abs
            
        else
            
            # start_s_d= start_line.stations.index {|station_sd| station_sd.name == start_station} 
            parkst = start_line.stations.index {|parks| parks.name == "Park Street"}
            
            # end_s_d= end_line.stations.index {|station_ed| station_ed.name == end_station} 
            
            parke = end_line.stations.index {|parks| parks.name == "Park Street"}
            
            totald = (start_s - parkst).abs+(end_s - parke).abs
             totald.abs


        
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
p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') #0

p mbta.stops_between_stations('Red', 'South Station', 'Red', 'Alewife') # 7

p mbta.stops_between_stations('Red', 'South Station', 'green', 'Kenmore') # 6 
