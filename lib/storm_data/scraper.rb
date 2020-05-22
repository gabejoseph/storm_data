class StormData::Scraper 
  
  def self.scrape_prelim(x)
    case x.name
    when "Atlantic"
      x.url = "https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      x.prelim = atlantic.css("button").collect{|x| x.text}
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      @prelim = eastern.css("button").collect{|x| x.text}
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      @prelim = pacific.css("button").collect{|x| x.text}
    end
  end 
  
  def self.add_extra(user_input)
    case user_input
    when "Atlantic"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      x = atlantic.css("pre").collect{|x| x.text}
      puts x[0].split("\n").drop(4).join("\n")
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      x = eastern.css("pre").collect{|x| x.text}
      puts x[0].split("\n").drop(4).join("\n")
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      x = pacific.css("pre").collect{|x| x.text}
      puts x[0].split("\n").drop(4).join("\n")
    end
  end 
 
end 
