class Community 

  def initialize
    @grid_mapping = []  
  end

  def tick  
    @grid_mapping.each do |cell|
      lonely_or_overcrowed_cells_die(cell)
      reproduction_of(cell)
    end 
  end             

  def seed(cells)
    @grid_mapping = cells
  end  

  def number_of_neighbors_for(cell)
    size = 0
    size = count_cell(cell, Location::NORTHWEST, size)
    size = count_cell(cell, Location::NORTHEAST, size)
    size = count_cell(cell, Location::SOUTHWEST, size)
    size = count_cell(cell, Location::SOUTHEAST, size)
    size = count_cell(cell, Location::NORTH, size)
    size = count_cell(cell, Location::SOUTH, size)
    size = count_cell(cell, Location::EAST, size)
    size = count_cell(cell, Location::WEST, size)
    size
  end             

  private

  def count_cell(original, direction, size)
    result = @grid_mapping.detect{ |c| c.location ==(Location.add(original.location, direction))}
    if result
      size += 1
    end
      size
    end            

  def lonely_or_overcrowed_cells_die(cell)
    neighbors_count = number_of_neighbors_for(cell)
    if neighbors_count != 2 or neighbors_count == 3
      cell.die 
    end
  end  

  def reproduction_of(cell)
    neighbors_count = number_of_neighbors_for(cell)
    if cell.dead? and neighbors_count == 3
      cell.birth         
    end  
  end          
end                          