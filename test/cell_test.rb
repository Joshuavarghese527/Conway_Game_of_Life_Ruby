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
end 