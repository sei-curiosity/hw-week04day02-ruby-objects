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
            
            sl= start_line.stations.index{|station|station.name==start_station}
            el =end_line.stations.index{|station| station.name ==end_station}

            
            if start_line === end_line
               
                stops =(sl-el).abs

                puts "Same Lines stops =#{stops} "
               
            else
                
                s_parksl= start_line.stations.index{ |station| station.name =="Park Street"}
                s_parkel= end_line.stations.index{ |station| station.name =="Park Street"}
                    puts s_parksl
                p1 = (sl - s_parksl).abs
                p2 =(el - s_parkel).abs

                t_stops=p1+p2
                puts "different Lines stops = #{t_stops}"
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
    mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6