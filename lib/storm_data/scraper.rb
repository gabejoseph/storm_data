class StormData::Scraper 
  
  def self.scrape(input)
    
    case input.name
    when "Atlantic"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      input.prelim = atlantic.css("button").collect{|x| x.text}
      x = atlantic.css("pre").collect{|x| x.text}
      input.supp = x[0].split("\n").drop(4).join("\n")
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      input.prelim = eastern.css("button").collect{|x| x.text}
      y = eastern.css("pre").collect{|x| x.text}
      input.supp = y[0].split("\n").drop(4).join("\n")
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      input.prelim = pacific.css("button").collect{|x| x.text}
      y = pacific.css("pre").collect{|x| x.text}
      input.supp = y[0].split("\n").drop(4).join("\n")
    end
  end 
 
end 
