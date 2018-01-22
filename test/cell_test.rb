require 'minitest/autorun'

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

describe Cell do            
  it 'is living when it is created' do            
    cell = Cell.new(0,0)

    assert cell.living?            
  end  
  it 'can transition to dead state' do
    cell = Cell.new(0,0)
    cell.die 
    refute cell.living?
  end         
end 