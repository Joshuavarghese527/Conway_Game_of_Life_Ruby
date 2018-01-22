class Community 
  def initialize
    @grid_mapping = []  
  end

  def tick  
    @grid_mapping.clear           
  end            

  def living_cells
    @grid_mapping.size            
  end 

  def seed(cells)
    @grid_mapping = cells
  end           
end 