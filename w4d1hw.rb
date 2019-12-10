Subwayline = {

    Red: ["South Station",
         "Park Street",
         "Kendall",
         "Central", 
         "Harvard",
         "Porter",
         "Davis",
         "Alewife"],

    Green: ["Government Center",
            "Park Street", 
            "Boylston", 
            "Arlington", 
            "Copley", 
            "Hynes", 
            "Kenmore"],

    Orange: ["North Station", 
             "Haymarket", 
             "Park Street", 
             "State", 
             "Downtown Crossing", 
             "Chinatown", 
             "Back Bay", 
             "Forest Hills"]

 }

 def stopsBetweenStations(startLine, startStation, endLine, endStation)

 startStationIndex = Subwayline[startLine.to_sym].index(startStation)
 endStationIndex = Subwayline[endLine.to_sym].index(endStation)


 
 if(startLine == endLine) 
 return (startStationIndex - endStationIndex)
 end

 startLineParkStreetIndex = Subwayline[startLine.to_sym].index("Park Street")
 tripToParkStreet = (startStationIndex - startLineParkStreetIndex)
  
 endLineParkStreetIndex = Subwayline[endLine.to_sym].index("Park Street")
 
 tripToDestination = (endStationIndex - endLineParkStreetIndex)
 
 totalTrip = tripToParkStreet + tripToDestination
end
p stopsBetweenStations('startLine', 'startStation', 'endLine', 'endStation')