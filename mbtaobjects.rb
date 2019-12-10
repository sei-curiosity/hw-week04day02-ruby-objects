##------------------
##-- Create the Class---
##---Get really good at Ruby classes and objects

##---SubWay System-MBTA---
##-- {Subway} has three lines-{Red}, {Green}, {Orange}

class Subway
    attr_reader :red, :green, :orange 
    def initialize  #--Lines
        @red = Line.new("red", [ "South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife" ])
        @green = Line.new("green", [ "Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore" ])
        @orange = Line.new("orange", [ "North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end


    def stop_bw_stations (start_line, start_station, end_line ,end_station)
                                    ##--------------["agreement", "user", "client"]
                                    ##------------.map{|k| instance_variable_get("@#{k}")} 

        start_line = instance_variable_get ("@#{start_line.downcase}")
        end_line =instance_variable_get ("@#{end_line.downcase}")
        
        s1 = start_line.stations.index { |station| station.name == start_station}
        e1= end_line.stations.index { |station| station.name == end_station}

        if start_line == end_line   ##Do the calculation of the distination 
                steps = (s1 - e1).abs() 
                puts ("steps = #{steps}")
                return steps
        else
                puts "differrent Lines"
                i_park_start_line= start_line.stations.index { |station| station.name == "Park Street"}
                i_park_end_line= end_line.stations.index { |station| station.name == "Park Street"}

                path1= (s1- i_park_start_line).abs()
                path2= (e1- i_park_end_line).abs()
                 total_steps= path1 + path2
                 p total_steps
                 return total_steps
               
        end
            
    end

end

class Line
    attr_reader :name, :stations
    def initialize (name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station)} 
                                                            
    end

end 


class Station
    attr_reader :name

    def initialize (name) 
        @name= name
    end

end

mbta = Subway.new
mbta.stop_bw_stations('Red', 'Alewife', 'Red', 'Alewife') ##0
mbta.stop_bw_stations('Red', 'Alewife', 'Red', 'South Station') ##7
mbta.stop_bw_stations('Red', 'South Station', 'Green', 'Kenmore') ## 6



#   mbta = Subway.new
#   mbta.stop_bw_stations('Red', 'South Station', 'Green', 'Kenmore') 

#   # "You must travel through the following stops on the Red line:"
  # "South Station and Park Street"
  # "Change at Park Street."
  # "Your trip continues through the following stops on Green Line:" 
  # "Boylston, Arlington, Copley, Hines, and Kenmore."
  # "7 stops in total."