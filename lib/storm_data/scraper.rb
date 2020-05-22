class StormData::Scraper 
  
  def self.scrape(x)
    case x.name
    when "Atlantic"
      atlantic = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5"))
      x.prelim = atlantic.css("button").collect{|x| x.text}
      y = atlantic.css("pre").collect{|x| x.text}
      x.supp = y[0].split("\n").drop(4).join("\n")
    when "Eastern Pacific"
      eastern = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5"))
      x.prelim = eastern.css("button").collect{|x| x.text}
      y = eastern.css("pre").collect{|x| x.text}
      x.supp = y[0].split("\n").drop(4).join("\n")
    when "Central Pacific"
      pacific = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5"))
      x.prelim = pacific.css("button").collect{|x| x.text}
      y = pacific.css("pre").collect{|x| x.text}
      x.supp = y[0].split("\n").drop(4).join("\n")
    end
  end 
 
end 
