require 'minitest/autorun'
require_relative "../classes/community" 
require_relative "../classes/cell" 
               
describe Community do            
  it 'Community with no living cells will contain no living cells in the next generation' do  
     community  = Community.new            
     community.tick            

     living_cells = community.living_cells            

     assert_equal 0, living_cells
  end 
  it 'Community with one living cell will die in the next generation' do 
    cell = Cell.new(0,0)
    community = Community.new            
    community.seed([cell])

    community.tick            

    assert_equal 0, community.living_cells            
  end  
  it 'Community with two living cells as neighbors will stay living in the next generation' do  
    skip          
    c1 = Cell.new(0,0)
    c2 = Cell.new(0,1)
    c3 = Cell.new(-1,1)

    community = Community.new            
    community.seed([c2,c3])

    community.tick            

    assert_equal 2, community.living_cells            
  end                          
end  