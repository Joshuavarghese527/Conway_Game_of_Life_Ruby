require 'minitest/autorun'
require_relative "../classes/community" 
require_relative "../classes/cell" 
require_relative "../classes/location" 
               
describe Community do            
  it 'Community with no living cells will contain no living cells in the next generation' do  
     community  = Community.new            
     community.tick            

     living_cells = community.living_cells            

     assert_equal 0, living_cells
  end 
  it 'Community with one living cell will die in the next generation' do 
    cell = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([cell])

    community.tick            

    assert_equal 0, community.living_cells            
  end  
  it 'Community with two living cells as neighbors will stay living in the next generation' do            
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)

    community = Community.new            
    community.seed([c2,c3])

    community.tick            

    assert c1.living?           
  end
  it 'Number of neighbors is 0 for a cell that is lonely' do
    c1 = Cell.new(Location::CENTER)
    community = Community.new
    community.seed([c1])

    assert_equal 0, community.number_of_neighbors_for(c1)
  end
  it 'Number of neighbors is 1 for a cell that has a neighbor in north' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    community = Community.new
    community.seed([c1, c2])

    assert_equal 1, community.number_of_neighbors_for(c1)  
  end 
  it 'Number of neighbors is 2 for a cell that has a neighbor in north and south' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    community = Community.new
    community.seed([c1, c2, c3])

    assert_equal 2, community.number_of_neighbors_for(c1)
  end
  it 'Number of neighbors is 2 for a cell that has a neighbor in north and west' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    community = Community.new
    community.seed([c1, c2, c3])

    assert_equal 2, community.number_of_neighbors_for(c1)
  end
end  