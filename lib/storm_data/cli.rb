class StormData::CLI 
  
  attr_accessor :region, :prelim
  
  @@all = []
  
  def call 
    @region = gets.strip
    if @region == "Atlantic" || @region == "Eastern Pacific" || @region == "Central Pacific"
      prelim_data
      StormData::Scraper.add_extra(@region)
      save
    else 
      puts "Invalid response, please enter 'Atlantic, Eastern Pacific or Central Pacific."
      call 
    end 
  end 
  
  def prelim_data 
    variable = StormData::Scraper.new.scrape_prelim(@region)[0]
    if variable.prelim[1] != "None"
      puts "Registered Disturbances are as follows:"
      puts "#{variable.prelim.join(" ")}"
    else 
      puts "No Disturbances detected"
    end 
  end 
  
  def supp_data 
    
  end 
  
  def save  
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.clear 
    @all.clear 
  end 
    
end