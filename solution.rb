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
      # stationsR= start_line.stations.name.map{|k| instance_variable_get("@#{k}")}
      # puts stationsR

      if start_line === end_line
          address_st1 = start_line.stations.find_index {|station| station.name== start_station}
          # puts address_st1
          address_st2 = start_line.stations.find_index {|station| station.name== end_station}
          # puts address_st2
          stops_st = address_st1 - address_st2
          puts "the numbers of stops btn stations is : #{stops_st}"
                 
         else
          puts "different Lines"
           line1_startS= start_line.stations.find_index{|station|station.name ==start_station }
          #  puts line1_startS
           line1_endS= start_line.stations.find_index{|station|station.name =="Park Street"}
          #  puts line1_endS
          result1=line1_endS-line1_startS
          line2_startS = end_line.stations.find_index {|station| station.name== end_station}
          # puts line2_startS
          line2_endS= start_line.stations.find_index{|station|station.name =="Park Street"}
          # puts line2_endS

          result2=line2_startS-line2_endS
           result = result1+result2
          puts "the numbers of stops btn stations is : #{result}"

          #Bounce 
        #  stations_names1 = start_line.stations.find{ |station|
        #   if station.name==start_station
        #   stations.names
        #   end
          
          
         
        #  puts "hi #{stations_names1} "
      end
      



    end
  end
    
  # One line, all the stations on that line
class Line
  attr_reader :name, :stations
    def initialize(name,stations)
      @name=name
      @stations=stations.map { |station| Stations.new(station)}
    end
 
end
  
  # One station
  class Stations
      attr_reader :name
      def initialize(name)
        @name=name

      end
 
  end
  
#   And we should be able to find the number of stops with

  mbta = Subway.new
   mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
   mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
   mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6


