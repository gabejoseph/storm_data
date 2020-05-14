class StormData::CLI 
  
  attr_accessor :region
  
  @@all = []
  
  def call 
    @region = region
    @region = gets.strip
    if @region == "Atlantic" || @region == "Eastern Pacific" || @region == "Central Pacific"
      StormData::Scraper.new.scrape(@region)
      binding.pry
      mysterymethod
      @@all << self 
    else 
      puts "Invalid response, please enter 'Atlantic, Eastern Pacific or Central Pacific."
      call 
    end 
  end 
  
  def mysterymethod
    StormData::Scraper #method that collects appropriate data
    #collect data from scraper on appropriate region.
    #this includes surface level data
    #assign this data to self and push to all
  end 
  
  def self.all 
    @@all
  end 
  
  def self.clear 
    @all.clear 
  end 
  
  
  
#   def method1(region)
#     #approrpiate data from scraper
#     #returns disturbance and info on disturbance in interpolated string
#     puts "Would you like to check a different area?"
#     puts "If so, please type 'yes' to continue, or 'exit' to end program"
#     finalresponse = gets.strip
#     if finalresponse == "yes" 
#       call
#     elsif finalresponse == "exit"
#       if no "Thanks for using storm chasers!"
#        @@all.clear
#     else 
#       puts "invalid response"
#       call 
#     end 
#   end 
  
  
    
end