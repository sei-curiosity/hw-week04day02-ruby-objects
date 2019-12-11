class Subway
    attr_reader :red, :green, :orange
    def initialize
        @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
        @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
        @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end


    def stops_between_stations(start_line, start_station, end_line, end_station)

        @start_line = instance_variable_get("@#{start_line.downcase}") # it was sent as a string from the user, and here I can deal with it as a variable of class Subway
        @end_line = instance_variable_get("@#{end_line.downcase}")
        @first_index
        @last_index
        @stops
        @first_station_stops
        @last_station_stops

        puts "You must travel through the following stops on the #{@start_line.name.capitalize} line:"

        if @start_line == @end_line 
            
                #if @start_line == @red
                #puts "You are now dealing with line red"
                #puts @red.stations[0].name
                #@red.stations.length.times{|i| puts @red.stations[i].name} #just to print the stations
                #puts @red.stations.length
            if start_station == end_station
                    @stops = 0
                else
                
                
                @start_line.stations.length.times{|i| 
                      # I am dealing with the objects of type station

                if @start_line.stations[i].name == start_station
                    @first_index = i
                    #puts @first_index
                    puts "Going through #{@start_line.stations[i].name}"
                   elsif @start_line.stations[i].name == end_station
                    @last_index = i
                    #puts @last_index
                end
                
                puts "and #{@start_line.stations[i].name}"

                } # end looping through the array of objects type station
                @subtraction = @last_index - @first_index
                @stops = @subtraction.abs()
                
                
                puts "Ending at #{@start_line.stations[@last_index].name}"

            end 
            puts @stops
                #end
        
        else # when the lines are different
        
            #puts "Hey I have diff lines"

            #looping and getting needed info from 1st object
            @start_line.stations.length.times {|i| 
            if @start_line.stations[i].name == start_station
                @first_index = i
                # puts @first_index
            end
            
            if @start_line.stations[i].name == "Park Street"
                @last_index = i
                # puts @last_index
            end

            } # end of loop

            @subtraction = @last_index - @first_index
            @first_station_stops = @subtraction.abs()

            #looping and getting needed info from 2nd object
            @end_line.stations.length.times {|i|
            if @end_line.stations[i].name == end_station
                @first_index = i
            end

            if @end_line.stations[i].name == "Park Street"
                @last_index = i
            end

            } # end of loop

            @subtraction = @last_index - @first_index
            @last_station_stops = @subtraction.abs()

            puts @first_station_stops + @last_station_stops

        end # end if it's same line or diff lines

    end # end stops_between_stations method

end # end class Subway





class Line
    attr_reader :name, :stations
    def initialize(name, stations)
        @name = name
        @stations = stations.map {|element| Station.new(element)} # the property @station is an array of objects, each object is an instance variable of class Station which has a name to be passed in the initialization
    end 
end # end class Line






class Station
    attr_reader :name
    def initialize(name)
        @name = name
    end


    # def info # a method to help me print the name of each station
    #     @name
    # end 

end # end class Station



my_subway = Subway.new
#p my_subway.red.name # this is to only print the name of line red
#p my_subway.red.stations[0].name # this is to print the name of the first station of line red

# how to loop the array of stations and print each element
#my_subway.red.stations.length.times {|i| puts my_subway.red.stations[i].name}

#p my_subway.green.name
#my_subway.green.stations.length.times {|i| puts my_subway.green.stations[i].name}

#my_subway.stops_between_stations("Red","South Station","Red","Davis")
# my_subway.stops_between_stations("Red","Alewife","Red","Alewife")
# my_subway.stops_between_stations("Red","Alewife","Red","South Station")
# my_subway.stops_between_stations("Red","South Station","Green","Kenmore")


#trying the double bonus

puts "Enter the start line"
s_line = gets.chomp
puts "Enter the start station"
s_station = gets.chomp
puts "Enter the end line"
e_line = gets.chomp
puts "Enter the end station"
e_station = gets.chomp

my_subway.stops_between_stations(s_line, s_station, e_line, e_station)
