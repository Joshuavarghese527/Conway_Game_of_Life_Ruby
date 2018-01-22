require 'minitest/autorun'
require_relative "../classes/community" 
require_relative "../classes/cell" 
require_relative "../classes/location" 
               
describe Community do            
  it 'neighborhood with one living cell will die in the next generation' do            
    cell = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    community = Community.new            
    community.seed([cell, c2])

    community.tick            

    assert cell.dead?, 'Cell is still living'
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
  it 'Number of neighbors is 8 for a center cell that has a neighbor in all locations' do            
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    c4 = Cell.new(Location::EAST)
    c5 = Cell.new(Location::WEST)
    c6 = Cell.new(Location::NORTHWEST)
    c7 = Cell.new(Location::NORTHEAST)
    c8 = Cell.new(Location::SOUTHWEST)
    c9 = Cell.new(Location::SOUTHEAST)
    community = Community.new
    community.seed([c1, c2, c3, c4, c5, c6, c7, c8, c9])

    assert_equal 8, community.number_of_neighbors_for(c1)
  end
  it 'Number of neighbors is 3 for a cell that has a neighbor in north, west, and center' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end
  it 'number of neighbors is 3 for a south west cell that has a neighbor in east, center and south' do            
    c1 = Cell.new(Location::SOUTHWEST)
    c2 = Cell.new(Location::SOUTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end  
  it 'number of neighbors is 3 for a south west cell that has a neighbor in east, center and south' do            
    c1 = Cell.new(Location::SOUTHEAST)
    c2 = Cell.new(Location::SOUTH)
    c3 = Cell.new(Location::EAST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end 
  it 'number of neighbors is 3 for a north cell that has a neighbor in northeast, center and northwest' do            
    c1 = Cell.new(Location::NORTH)
    c2 = Cell.new(Location::NORTHWEST)
    c3 = Cell.new(Location::NORTHEAST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end 
  it 'number of neighbors is 3 for a south cell that has a neighbor in southeast, center and southwest' do            
    c1 = Cell.new(Location::SOUTH)
    c2 = Cell.new(Location::SOUTHWEST)
    c3 = Cell.new(Location::SOUTHEAST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end 
  it 'number of neighbors is 3 for a east cell that has a neighbor in southeast, center and northeast' do            
    c1 = Cell.new(Location::EAST)
    c2 = Cell.new(Location::NORTHEAST)
    c3 = Cell.new(Location::SOUTHEAST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end 
  it 'number of neighbors is 3 for a west cell that has a neighbor in southwest, center and northwest' do            
    c1 = Cell.new(Location::WEST)
    c2 = Cell.new(Location::NORTHWEST)
    c3 = Cell.new(Location::SOUTHWEST)
    c4 = Cell.new(Location::CENTER)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    assert_equal 3, community.number_of_neighbors_for(c1)
  end 
  it 'a cell with 4 living cells will die of overcrowding' do            
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::NORTHWEST)
    c4 = Cell.new(Location::WEST)
    c5 = Cell.new(Location::SOUTHWEST)
    community = Community.new            
    community.seed([c1, c2, c3, c4, c5])

    community.tick            

    assert c1.dead?            
  end 
  it 'a dead cell with three living cells as neighbors will be born in the next generation' do            
    c1 = Cell.new(Location::CENTER)
    c1.die            
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::NORTHWEST)
    c4 = Cell.new(Location::NORTHEAST)
    community = Community.new            
    community.seed([c1, c2, c3, c4])

    community.tick            

    assert c1.living?            
  end
end  