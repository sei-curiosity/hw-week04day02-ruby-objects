class Subway
    attr_accessor(:name ,:lines)
    def initialize (name) 
    @name = name
    lines=[]
    end

#method to fined the lines 
def getLineStation(station_1,station_2)
    line_1 =-1
    line_2 =-1
    lines.each do |line|
        if line_1==-1
            line_1=line_1.stations.indexOf(station_1)
        end
        if line_2==-1
            line_2=line_2.stations.indexOf(station_2)
        end
    end
    checkSameline(line_1,station_1,line_2,station_2)
end

#method to check if the lines are the same 
def checkSameline(line_1,station_1,line_2,station_2)
    
    if line_1 == line_2||line_1.stations.indexOf(station_2)!=-1
        return sameLine(line_1,station_1,station_2)
        
    
    elsif line_2.stations.indexOf(station_1)!=-1
          return sameLine(line_2,station_1,station_2)
    end
    return differentLines(line_1,station_1,line_2,station_2)
end


#method to move on thesame line 
def sameLine(line, station_1 ,station_2='tihisone')
    line.getDestence(station_1,station2) >0 ?   line.moveNigative(station_1,station2):line.movePsititve 
end



#move in different lines 
def differentLines(line_1,station_1,line_2,station_2)
    sameLine(line_1, station_1)
    sameLine(line__2, "tihisone",station_2)
end
end

#
class Station 
    attr_accessor(:name ,:location)
    def initialize (name) 
    @name = name
    @location={}
    end

    def addLOcation(line,previous,next_1)
        location[line]={the_previous:previous,the_next:next_1}
    end


    
end 





class Line
    attr_accessor(:name ,:stations,:line_connection)
    def initialize (name) 
    @name = name
    @stations =[]
    @line_connections={}
end 


def add_station(station)
    stations.push(station)
end

def addLineConnection(line,station)
    line_connections.push({line:station})
end 

def get_line_length
    stations.length
end

def getDestence(station_1,station2)
    @stations.indexOf(station_1)-@stations.indexOf(station_1)
end

def getDirection(station_1,nmbeer)
    if number>0
        moveToprevious(station_1,nmbeer)
    else
        moveTonext(station_1,nmbeer)
    end
end

def moveNigative(station_1,station2)
    currentstation = station_1
    while true do 
        currentstation  = currentstation.location[:the_previous]
        puts"the train is moving on the #{self.name} arriving to  #{self.stations.index(currentstation)}"
        if currentstation.name ==station2
            break 
        end 
end
end



def movePositve(station_1,station2)
    currentstation = station_1
    while true do 
        currentstation = currentstation.location[:next_1]
        puts"the train is moving on the #{self.name} arriving to  #{self.stations.index(currentstation)}"
        if currentstation.name ==station2
            break 
        end 
end
end
end




statin = Station.new('madienah')
puts statin.name
statin.addLOcation('red','manar','hfar')
puts statin.location



