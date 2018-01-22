class Cell                
  def initialize(x, y)
    @living = true
    @x = x
    @y = y
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
end    