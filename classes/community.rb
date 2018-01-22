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

  def neighbors?(cell1, cell2)
    if cell1.center? or cell2.center?
       true
    end
  end         
end 