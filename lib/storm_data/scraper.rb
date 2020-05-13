class StormData::Scraper 
  
  @@all = []
  
  attr_accessor :prelim, :extra
  
  def scrape
    input = StormData::CLI.all[0].region
    case input
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
    binding.pry 
  end 
  
  def save 
    @@all << self 
  end 
  
  # def preliminary_data
  # end 
  
  # def extra_data 
  #   if .css("pre").text 
  #     puts - .css("pre").text
  #   else 
  #     puts "No extra information on this weather disturbance!"
  #   end 
  # end 
  
  def self.all 
    @@all
  end 
  
  def self.clear 
    @@all.clear 
  end 

  # @@all.clear after scrape
  
# /html/body/div[5]/div/table[3]/tbody/tr/td/table[1]/tbody/tr/td/button[1] - Disturbances:
# /html/body/div[5]/div/table[3]/tbody/tr/td/table[1]/tbody/tr/td/button[2] - None or all[1]  
# /html/body/div[5]/div/table[5]/tbody/tr/td[2]/button - Tropical Weather Discussion

  
end 
