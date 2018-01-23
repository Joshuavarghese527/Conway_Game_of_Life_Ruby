class Cell  
attr_reader :location  
            
  def initialize(location)
    @living = true            
    @location = location
  end              

  def living?            
    @living == true         
  end  

  def die
    @living = false          
  end 

  def center?
    (@x == 0 and @y == 0)
  end

  def dead?              
    !living?
  end 

  def birth
    @living = true
  end 

  def at?(location)
    @location == location
  end  
end   