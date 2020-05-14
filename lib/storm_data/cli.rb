class StormData::CLI 
  
  attr_accessor :region, :prelim
  
  @@all = []
  
  def call 
    @region = gets.strip
    if @region == "Atlantic" || @region == "Eastern Pacific" || @region == "Central Pacific"
      variable = StormData::Scraper.new.scrape_prelim(@region)[0][1]
      "None" == StormData::Scraper.new.scrape_prelim(@region)[0][1]
      puts "#{variable[0]} #{variable[1]}"
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