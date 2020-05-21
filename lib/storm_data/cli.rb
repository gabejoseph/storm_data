class StormData::CLI 
  
  attr_accessor :region, :prelim
  
  @@all = []

  def call 
    puts "Which region would you like to check for activity?"
    puts "Atlantic, Eastern Pacific or Central Pacific? (case-sensitive)"
    userinput = gets.strip
    @region = StormData::Region.find_by_name(userinput) 
    x = StormData::Scraper.scrape_prelim(@region)
    binding.pry
  end 
  
  def self.prelim_data 
    if @region.prelim[1] != "None"
      binding.pry
      puts "Registered Disturbances are as follows:"
      puts "#{variable.prelim.join(" ")}"
      supp_data
    else 
      puts "No Disturbances detected"
      supp_data
    end 
  end 
  
  def supp_data 
    puts "Would you like supplementary data on this region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      StormData::Scraper.add_extra(@region)
      restart
    elsif variable == "No" || variable == "no"
      restart
    else
      puts "Invalid reponse, please enter 'Yes or No'"
      supp_data
    end 
  end 
  
  def restart 
    puts "Would you like to check a new region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      StormData::CLI.clear 
      StormData::Scraper.clear
      call
    elsif variable == "No" || variable == "no"
      puts "Thanks for using 'Storm Chasers!'"
    else 
      "Invalid response, please enter 'Yes or No'"
      restart
    end 
  end 
  
  def save  
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.clear 
    @@all.clear 
  end 
    
end