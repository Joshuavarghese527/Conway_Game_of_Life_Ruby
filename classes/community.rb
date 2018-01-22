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
        size += count_east_cell
        size += count_west_cell
        size += count_northwest_cell
        size += count_northeast_cell
        size += count_southwest_cell
        size += count_southeast_cell
      elsif cell.location == Location::NORTHWEST
        size += count_north_cell
        size += count_west_cell
        size += count_center_cell
      elsif cell.location == Location::NORTHEAST
        size += count_north_cell
        size += count_east_cell
        size += count_center_cell
      elsif cell.location == Location::SOUTHWEST
        size += count_south_cell
        size += count_west_cell
        size += count_center_cell
      elsif cell.location == Location::SOUTHEAST
        size += count_south_cell                                          
        size += count_east_cell
        size += count_center_cell
      elsif cell.location == Location::NORTH
        size += count_northwest_cell
        size += count_center_cell
        size += count_northeast_cell
        size += count_west_cell
        size += count_east_cell
      elsif cell.location == Location::SOUTH
        size += count_southwest_cell
        size += count_center_cell
        size += count_southeast_cell
        size += count_west_cell
        size += count_east_cell
      elsif cell.location == Location::EAST
        size += count_northeast_cell
        size += count_center_cell
        size += count_southeast_cell
        size += count_north_cell
        size += count_south_cell
      elsif cell.location == Location::WEST
        size += count_northwest_cell                                          
        size += count_center_cell
        size += count_southwest_cell
        size += count_north_cell
        size += count_south_cell
      end             
    size
  end            

  private            

  def find_cell(location)
    @grid.detect {|c| c.location == location}
  end      

  def count_north_cell            
    count_cell(find_cell(Location::NORTH))
  end      

  def count_south_cell            
    count_cell(find_cell(Location::SOUTH))
  end     

  def count_east_cell            
    count_cell(find_cell(Location::EAST))
  end    

  def count_west_cell            
    count_cell(find_cell(Location::WEST))
  end   

  def count_northwest_cell            
    count_cell(find_cell(Location::NORTHWEST))
  end    

  def count_southwest_cell            
    count_cell(find_cell(Location::SOUTHWEST))
  end   

  def count_northeast_cell            
    count_cell(find_cell(Location::NORTHEAST))
  end    

  def count_southeast_cell            
    count_cell(find_cell(Location::SOUTHEAST))
  end  

  def count_center_cell              
  count_cell(find_cell(Location::CENTER))
  end   

  def count_cell(predicate)
    if predicate
      1
    else            
      0
    end            
  end            
end