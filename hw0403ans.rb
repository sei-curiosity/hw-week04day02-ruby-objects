
class Subway
    attr_reader :red , :green, :orange
    def initialize()
        @red = Line.new("red",["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
        @green = Line.new("green",["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
        @orange = Line.new("orange",["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
    end
    def stops_between_stations(start_line, start_station, end_line, end_station)
    start_line = instance_variable_get("@#{start_line.downcase}")
    end_line = instance_variable_get("@#{end_line.downcase}")

    # travel_line = start_line.stations[Station.name.to_s]
    starting = start_line.stations.map {|station| station.name}
    starting_ind = starting.index(start_station)
      ending = end_line.stations.map {|station| station.name}
      end_ind = ending.index(end_station)
      if (start_line == end_line) 
      distance = (starting_ind.to_i-end_ind.to_i).abs
      puts "the number of stations is: #{distance}"
      if (starting_ind < end_ind)
     puts "The stations you'll pass by #{(starting[starting_ind..end_ind]).to_s}"
      end
     if (starting_ind >= end_ind)
       puts "The stations you'll pass by #{(starting[end_ind..starting_ind].reverse).to_s}"
     end
     else
        sps_ind = starting.index("Park Street")
        spe_ind = ending.index("Park Street") 
         distance1 = (starting_ind - sps_ind)
         distance2 = (spe_ind - end_ind) 
         distance = (distance1).abs + (distance2).abs
         puts "the number of stations is: #{distance}" 
         if (starting_ind < sps_ind)
            a =  starting[starting_ind...sps_ind]
            elsif (starting_ind >= sps_ind)
                a =  starting[sps_ind..starting_ind].reverse
                
             end
            if (spe_ind < end_ind)
              b = ending[spe_ind..end_ind]
              elsif  (spe_ind >= end_ind)
                b = ending[end_ind..spe_ind].reverse
            end
            puts "The stations you'll pass by #{(a+b).to_s} "
     end
    end

class Line 
    attr_reader :name , :stations
    def initialize(name,stations)
        @name = name
        @stations = stations.map {|station| Station.new(station)}
    end
end

class Station 
    attr_reader :name
    def initialize (name)
        @name = name
    end
end
#    def Welcome
#    "Please enter your starting line (Red - Green - Orange)"
#    start_line = gets.chomp.downcase
#    "Please enter your starting station"
#    start_station = gets.chomp.downcase
#    "Please enter your ending line (Red - Green - Orange)"
#    end_line = gets.chomp.downcase
#    "Please enter your ending station"
#    start_station = gets.chomp.downcase
#     end
  end
 
 mbta = Subway.new
 mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Kendall')
 mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore')
#  mbta = Station.new
#  mbta.name