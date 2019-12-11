# One station
class Station
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

# One line, all the stations on that line
class Line
    attr_reader :name, :stations
    def initialize(name, stations)
        @name = name
        @stations = stations.map { |name| Station.new(name) }
    end
end

class Input
    attr_reader(:start_line, :start_station, :end_line, :end_station)

    def initialize
        self.input("Enter Start Line: ", "start_line")
        self.input("Enter Start Station: ", "start_station")

        self.input("Enter End Line: ", "end_line")
        self.input("Enter End Station: ", "end_station")
    end

    def input(question, variable_name)
        print question
        instance_variable_set("@#{variable_name}", gets.chomp)
    end
end

class Subway < Input
    attr_reader :red, :green, :orange
    def initialize(user_input_once = false, loop_input = false)
        @red = Line.new('red', [
            "South Station",
            "Park Street",
            "Kendall",
            "Central",
            "Harvard",
            "Porter",
            "Davis",
            "Alewife",
        ])

        @green = Line.new('green', [
            "Government Center",
            "Park Street",
            "Boylston",
            "Arlington",
            "Copley",
            "Hynes",
            "Kenmore",
        ])

        @orange = Line.new("orange", [
            "North Station",
            "Haymarket",
            "Park Street",
            "State",
            "Downtown Crossing",
            "Chinatown",
            "Back Bay",
            "Forest Hills",
        ])

        if user_input_once
            super()
            self.stops_between_stations(@start_line, @start_station, @end_line, @end_station)
        end

        if loop_input
            while true
                super()
                self.stops_between_stations(@start_line, @start_station, @end_line, @end_station)
                print "do you want to quit? (y/n) "
                quit = gets.chomp

                if quit.downcase.include? "y"
                    return nil
                end
            end
        end

    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        start_line = instance_variable_get("@#{start_line.downcase}")
        end_line = instance_variable_get("@#{end_line.downcase}")

        start_index = self.get_index(start_line, start_station)
        start_park_index = self.get_index(start_line, "Park Street")
        total_stops_start = start_park_index - start_index

        end_index = self.get_index(end_line, end_station)
        end_park_index = self.get_index(end_line, "Park Street")
        total_stops_end = end_park_index - end_index

        stops = nil
        if start_line == end_line
            stops = (start_index - end_index).abs()
        else
            stops = total_stops_start.abs() + total_stops_end.abs()
        end

        print_stops(start_line, start_index, end_line, end_index, stops)
        puts "#{stops} stops in total"
    end


    def get_index(line, target)
        index = nil
        line.stations.each do |station| 
            if station.name == target
                index = line.stations.index(station)
            end
        end

        index
    end

    def print_stops(start_line, start_index, end_line, end_index, stops)
        puts "start from #{start_line.stations[start_index].name} in Line #{start_line.name}"

        old_station = start_line.stations[start_index].name
        (start_index + 1..end_index + 1).each do |n|
            station = start_line.stations[n]

            if start_line == end_line
                puts "You moved From #{old_station} to #{station.name}"
                old_station = station.name
            else
                if station.name != "Park Street"
                    puts "You moved From #{old_station} to #{station.name}"
                    old_station = station.name
                end
                
                if station.name == "Park Street"
                    puts "changed line from #{start_line.name} to #{end_line.name} at Park Street"
                    old_station = "Park Street"

                    increase = end_line.name == 'orange' ? 2 : 1
                    (start_index + increase..end_index).each do |j|
                        end_station = end_line.stations[j]
                        if end_station.name != "Park Street"
                            puts "You moved From #{old_station} to #{end_station.name}"
                            old_station = end_station.name
                        end
                    end

                    break
                end
            end
        end

        puts "end at line #{end_line.name} at station #{end_line.stations[end_index].name}"
    end
end



subways = Subway.new()
# subways.stops_between_stations('Red', 'South Station', 'Red', 'Central') # 3 stops
# puts "*" * 30
# subways.stops_between_stations("Red", "South Station", "Green", "Kenmore") # 6 stops
# puts "*" * 30
# subways.stops_between_stations("Red", "Alewife", "Red", "Alewife") # 0 stops
# puts "*" * 30
subways.stops_between_stations('Red', 'South Station', 'orange', 'Forest Hills') # 3 stops


# with input -> loop_input = true which will run infinite loop and ask user
# subways = Subway.new(true)
