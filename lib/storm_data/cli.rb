class StormData::CLI 
  
  attr_accessor :region, :prelim
  
  @@all = []
  
  def call 
    @region = gets.strip
    if @region == "Atlantic" || @region == "Eastern Pacific" || @region == "Central Pacific"
      prelim_data
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
      supp_data
    else 
      puts "No Disturbances detected"
      supp_data
    end 
    supp_data
  end 
  
  def supp_data 
    puts "Would you like supplementary data on a region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes"
      StormData::Scraper.add_extra(@region)
    elsif variable == "No"
      puts "Thanks for using 'Storm Chasers!'"
      clear
      StormData::Scraper.clear
    else
      puts "Invalid reponse, please enter 'Yes or No'"
      supp_data
    end 
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