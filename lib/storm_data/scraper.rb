class StormData::Scraper 
  
  @@all = []
  
  def self.scrape_atlc
    atlc = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
    atlc.css("button").each do |x|
      x
      binding.pry
    end
  end 
  
  def self.scrape_epac
    epac = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
  end 
  
  def self.scrape_cpac 
    cpac = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
  end 
  
  
# /html/body/div[5]/div/table[3]/tbody/tr/td/table[1]/tbody/tr/td/button[1] - Disturbances:
# /html/body/div[5]/div/table[3]/tbody/tr/td/table[1]/tbody/tr/td/button[2] - None or all[1]  
# /html/body/div[5]/div/table[5]/tbody/tr/td[2]/button - Tropical Weather Discussion

  
end 
