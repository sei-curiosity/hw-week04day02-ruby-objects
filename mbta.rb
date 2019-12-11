class Subway
    ######helper functions######
    attr_reader(:red,:green,:orange)
    attr_accessor(:start_line, :start_station, :end_line, :end_station)

    ######properties######
    def initialize
        @red = ["","south station", "park street", "kendall",
            "central", "harvard", "porter", "davis", "alewife"]
        @green = ["","goverment center",
            "park street", "boylston", "arlington", "copley", "hynes", "kenmore"]
        @orange = ["north station", "haymarket", "park street", "state",
            "downtown crossing", "chinatown", "back bay", "forest hills"]
        @start_line = nil
        @start_station = nil
        @end_line = nil
        @end_station = nil

    end

    ######methods######
    def function()

    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        self.start_line = start_line
        self.start_station = start_station
        self.end_line = end_line
        self.end_station = end_station

    end
end
    
# One line, all the stations on that line
class Line
    ######helper functions######
    attr_reader(:stations)

    ######properties######
    def initialize(line_name)
        @stations = Subway.line_name
    end

    ######methods######
end
  
# One station
class Station
    ######helper functions######

    ######properties######
    def initialize(station_name, line_name)
        @station_number = Line.line_name.index(@station_number)
    end

    ######methods######
end

def main
    #System prompts user for destination
    puts "Hello, where would you like to go?"

    #User inputs info
    puts "Start line:"
    s_line = gets.downcase!
    puts "Start station:"
    s_station = gets.downcase!
    puts "End line:"
    e_line = gets.downcase!
    puts "End station:"
    e_station = gets.downcase!

    #System calls and instantiates a new Subway class
    mbta = Subway.new

    #System outputs info for user
    mbta.s

end

while
    main
end