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
      north_cell = @grid_mapping.detect {|c| c.location == Location::NORTH}
      south_cell = @grid_mapping.detect {|c| c.location == Location::SOUTH}

      if north_cell
        size += 1
      end            
      if south_cell
        size += 1
      end            
    elsif cell.location == Location::NORTHWEST
      north_cell = @grid_mapping.detect {|c| c.location == Location::NORTH}
      west_cell = @grid_mapping.detect {|c| c.location == Location::WEST}

      if north_cell
        size += 1
      end            
      if west_cell
        size += 1
      end            
    end            
    size
  end 
end