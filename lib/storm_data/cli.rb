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
  end 
  
  def supp_data 
    puts "Would you like supplementary data on a region?"
    puts "Type 'Yes or No' (case-sensitive)"
    variable = gets.strip
    if variable == "Yes"
      StormData::Scraper.add_extra(@region)
      restart
    elsif variable == "No"
      restart
    else
      puts "Invalid reponse, please enter 'Yes or No' (case-sensitive)"
      supp_data
    end 
  end 
  
  def restart 
    puts "Would you like to check a new region?"
    puts "Type 'Yes or No' (case-sensitive)"
    variable = gets.strip
    if variable == "Yes"
      clear 
      StormData::Scraper.clear
      call
    elsif variable == "No"
      puts "Thanks for using 'Storm Chasers!'"
    else 
      "Invalid response, pelase enter 'Yes or No'"
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
    @all.clear 
  end 
    
end