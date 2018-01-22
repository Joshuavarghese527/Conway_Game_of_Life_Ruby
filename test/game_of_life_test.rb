require 'minitest/autorun'

class Community                
  def tick            
  end            

  def alive_cells            
  end            
end                

describe Community do            
  it 'Community with no alive cells will contain no alive cells in the next generation' do  
    skip          
    cell = Cell.new(0,0)           
    community = Community.new
    community.seed(cell)           

    community.tick          

    assert_equal 0, alive_cells
  end            
end  