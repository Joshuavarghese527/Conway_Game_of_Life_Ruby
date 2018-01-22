require 'minitest/autorun'
require_relative "../classes/cell" 

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