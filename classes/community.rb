class Community 

  def initialize
    @grid_mapping = []  
  end

  def tick  
    if 
      @grid_mapping.size > 1
    else 
      @grid_mapping.clear
    end         
  end            

  def living_cells
    @grid_mapping.size            
  end 

  def seed(cells)
    @grid_mapping = cells
  end  

  def number_of_neighbors_for(cell)
      size = 0
      if cell.location == Location::CENTER
        size += count_north_cell
        size += count_south_cell
      elsif cell.location == Location::NORTHWEST
        size += count_north_cell
        size += count_west_cell
      end            
      size
    end            

 private            

  def find_cell(location)
    @grid_mapping.detect {|c| c.location == location}
  end            

  def count_north_cell            
    count_cell(find_cell(Location::NORTH))
  end            

  def count_south_cell            
    count_cell(find_cell(Location::SOUTH))
  end            

  def count_west_cell            
    count_cell(find_cell(Location::WEST))
  end            

  def count_cell(predicate)
    if predicate
      1
    else            
      0
    end            
  end            
end