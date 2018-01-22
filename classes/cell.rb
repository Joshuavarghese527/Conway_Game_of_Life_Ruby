class Cell                
  def initialize(location)
    @living = true
    @x = location[0]
    @y = location[1]
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

  def location              
    Location.for(@x, @y)
  end 
end    