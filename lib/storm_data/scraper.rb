class StormData::Scraper 
  
  @@all = []
  
  attr_accessor :prelim
  
  def scrape_prelim(user_input)
    case user_input
    when "Atlantic"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      @prelim = atlantic.css("button").collect{|x| x.text}
      save
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      @prelim = eastern.css("button").collect{|x| x.text}
      save
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      @prelim = pacific.css("button").collect{|x| x.text}
      save
    end
  end 
  
  def self.add_extra(user_input)
    case user_input
    when "Atlantic"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      puts atlantic.css("pre").collect{|x| x.text}
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      puts eastern.css("pre").collect{|x| x.text}
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      puts pacific.css("pre").collect{|x| x.text}
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
