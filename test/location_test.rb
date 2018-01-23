require 'minitest/autorun'
require_relative "../classes/location" 

describe Location do            
  it 'location for -1, 1 is north west' do            
    location = Location.for(-1, 1)

    assert_equal Location::NORTHWEST, location
  end                
  it 'location for 1, 1 is north east' do            
    location = Location.for(1, 1)

    assert_equal Location::NORTHEAST, location
  end                
  it 'location for -1, -1 is south west' do            
    location = Location.for(-1, -1)

    assert_equal Location::SOUTHWEST, location
  end                
  it 'location for 1, 1 is south east' do            
    location = Location.for(1, -1)

    assert_equal Location::SOUTHEAST, location
  end                
  it 'location for 0, 1 is north' do            
    location = Location.for(0, 1)

    assert_equal Location::NORTH, location
  end                
  it 'location for 0, -1 is south' do            
    location = Location.for(0, -1)

    assert_equal Location::SOUTH, location
  end                
  it 'location for 1, 0 is south' do            
    location = Location.for(1, 0)

    assert_equal Location::EAST, location
  end                
  it 'location for -1, 0 is south' do            
    location = Location.for(-1, 0)

    assert_equal Location::WEST, location
  end                
  it 'location for 0, 0 is center' do            
    location = Location.for(0, 0)

    assert_equal Location::CENTER, location
  end 
  it 'adding two locations returns a new location' do            
    result = Location.add(Location::SOUTH, Location::CENTER)

    assert_equal Location::SOUTH, result
  end                               
end   