class Cell                
  def initialize(x, y)
    @living = true
  end    

  def living?            
    @living == true         
  end  

  def die
    @living = false          
  end 
end    