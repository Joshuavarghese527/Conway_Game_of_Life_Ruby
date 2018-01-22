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
   north_cell = @grid_mapping.detect {|cell| cell.location ==  Location::NORTH}
   if north_cell
      1
    else
      0
    end
  end 
end 