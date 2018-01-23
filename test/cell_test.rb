require 'minitest/autorun'
require_relative "../classes/cell" 
require_relative "../classes/location" 

describe Cell do            
  it 'is living when it is created' do            
    cell = Cell.new(Location::CENTER)

    assert cell.living?            
  end  

  it 'can transition to dead state' do
    cell = Cell.new(Location::CENTER)
    cell.die 
    refute cell.living?
  end 

  it 'has a location' do
    cell = Cell.new(Location::NORTH)
    result = cell.location

    assert_equal Location::NORTH, result
  end    
  it 'dead cell can be born again' do 
    cell = Cell.new(Location::CENTER)
    cell.die 

    cell.birth

    assert cell.living?
  end   
end 