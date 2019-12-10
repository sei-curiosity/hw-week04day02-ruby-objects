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
        # this is the idea os the site apove
        # ["agreement", "user", "client"].map{|k| instance_variable_get("@#{k}")}

        start_line = instance_variable_get("@#{start_line.downcase}")
        end_line = instance_variable_get("@#{end_line.downcase}")
        main_station = "Park Street"
        counter = 0
        start_indx_main_station=0
        end_indx_main_station = 0
        #start_station = start_station.downcase
        #end_station = end_station.downcase
        # puts start_line.stations.index(:start_station)
        start_line.stations.each do |station|
            if (station.name == main_station)
            start_indx_main_station = start_line.stations.index(station)
         end
        end
        end_line.stations.each do |station|
            if (station.name == main_station)
            end_indx_main_station = end_line.stations.index(station)
         end
        end


        if start_line === end_line
            if start_station === end_station
                counter = 0
            else
             start_line.stations.each do |station|
                if (station.name == start_station)
                indx_start_station = start_line.stations.index(station)
                if (indx_start_station < start_indx_main_station)
                    for i in (indx_start_station .. start_indx_main_station-1) do
                        counter  = counter  + 1
                    end#for loop
                    else
                        for i in (start_indx_main_station .. indx_start_station).to_a.reverse do
                            counter  = counter + 1 
                        end#for loop
                end#if start main station
             end#if start station
            end#do loop

        end_line.stations.each do |station|
            if(station.name==end_station)
                indx_end_station = end_line.stations.index(station)
                if (indx_end_station < end_indx_main_station)
                    for i in (indx_start_station .. start_indx_main_station).to_a.reverse do
                        counter  = counter + 1 
                    end#for loop
                    else
                        for i in (end_indx_main_station+1 .. indx_end_station) do
                            counter  = counter + 1 
                        end#for loop
                end#if start main station
            end#if
        
        
        end#do loop
    end
        else#not the same line
            start_line.stations.each do |station|
                if (station.name == start_station)
                indx_start_station = start_line.stations.index(station)
                if (indx_start_station < start_indx_main_station)
                    for i in (indx_start_station .. start_indx_main_station-1) do
                        counter  = counter  + 1
                    end#for loop
                    else
                        for i in (start_indx_main_station .. indx_start_station).to_a.reverse do
                            counter  = counter + 1 
                        end#for loop
                end#if start main station
             end#if start station
            end#do loop

        end_line.stations.each do |station|
            if(station.name==end_station)
                indx_end_station = end_line.stations.index(station)
                if (indx_end_station < end_indx_main_station)
                    for i in (indx_start_station .. start_indx_main_station).to_a.reverse do
                        counter  = counter + 1 
                    end#for loop
                    else
                        for i in (end_indx_main_station+1 .. indx_end_station) do
                            counter  = counter + 1 
                        end#for loop
                end#if start main station
            end#if
        end#do loop
        end#end if
        puts counter
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
mbta.stops_between_stations('Red', 'South Station', 'Red', 'Alewife')
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Arlington')