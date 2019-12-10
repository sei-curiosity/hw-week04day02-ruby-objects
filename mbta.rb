red =["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"]
green =["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"]
orange =["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]

def stops_between_stations(start_line,start_stop,end_line,end_stop)
    start_point = start_line.index(start_stop)
    end_point = end_line.index(end_stop)
    if start_line == end_line
    trip = (start_point-end_point).abs
    return trip
    else
    line_1 = start_line.index("Park Street")
    line_2 = end_line.index("Park Street")
    trip = (start_point- line_1).abs + (end_point-line_2).abs
    return trip
end
end

p stops_between_stations(red,'Alewife',red,'Alewife') 
p stops_between_stations(red,'Alewife',red,'South Station') 
p stops_between_stations(red,'South Station',green,'Kenmore') 


