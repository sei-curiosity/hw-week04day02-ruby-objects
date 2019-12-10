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
            address_s =  start_line.stations.find_index {|s| s.name == start_station} 
            address_e =  end_line.stations.find_index {|e| e.name == end_station} 
            nofstops = address_e - address_s
            puts nofstops.abs

        else
           addressStationstart = start_line.stations.find_index { |ads| ads.name == start_station}
           address_park_s = start_line.stations.find_index {|ps| ps.name == 'Park Street'}
           addressStationend = end_line.stations.find_index {|ade| ade.name == end_station}
           address_park_e = end_line.stations.find_index {|pe| pe.name == 'Park Street'}
           numofstops= (address_park_e + addressStationend)-(address_park_s + addressStationstart) 
            

            puts numofstops.abs
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
  mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') #0

mbta.stops_between_stations('Red', 'South Station', 'Red', 'Alewife') # 7

mbta.stops_between_stations('Red', 'South Station', 'green', 'Kenmore') # 6