require 'minitest/autorun'

class Community                
  def tick            
  end            

  def living_cells            
  end            
end                

describe Community do            
  it 'Community with no living cells will contain no living cells in the next generation' do  
    skip          
    cell = Cell.new(0,0)           
    community = Community.new
    community.seed(cell)           

    community.tick          

    assert_equal 0, living_cells
  end            
end  