class Subway
    attr_reader :red, :green, :orange

    def initialize
        @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
        @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
        @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        
         start_line.map{|start_line| instance_variable_get("@#{start_line.downcase}")}
         
          

        start_line = instance_variable_get("@#{start_line.downcase}")

        end_line = instance_variable_get("@#{end_line.downcase}")

       
       index1_station = start_line.stations.index{|stat| stat.name == start_station}

        index2_station = end_line.stations.index {|stat|stat.name == end_station}

        index3_line= start_line.stations.index {|line| line.name == 'park Street'}

        index4_line = end_line.stations.index {|line| line.name == 'park Street'}

        


        if start_line === end_line
            stops = (index1_station - index2_station).abs

           puts "#{stops}"
            # puts "Same Lines"
        else
            toat = (index1_station - index3_line)abs + (index2_station - index4_line)  

            puts "#{toat}"
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
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife')