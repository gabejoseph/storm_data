class StormData::CLI 
  
  attr_accessor :region
  
  @@all = []
  
  def call 
    @region = gets.strip
    if @region == "Atlantic" || @region == "Eastern Pacific" || @region == "Central Pacific"
      StormData::Scraper.new.scrape_prelim(@region)
      StormData::Scraper.add_extra(@region)
      @@all << self 
    else 
      puts "Invalid response, please enter 'Atlantic, Eastern Pacific or Central Pacific."
      call 
    end 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.clear 
    @all.clear 
  end 
    
end