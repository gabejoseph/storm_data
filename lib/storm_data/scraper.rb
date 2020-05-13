class StormData::Scraper 
  
  @@all = []
  
  def self.scrape
    input = StormData::CLI.all[0].region
    case input
    when "Atlantic"
      atlc = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      binding.pry
    when "Eastern Pacific"
      epac = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
    when "Central Pacific"
      cpac = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
    end 
    binding.pry
    new = atlc.css("button").collect{|x| x.text}
    
    array = []
    atlc.css("button").text
    puts atlc.css("pre").text #extra data
    binding.pry 
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
