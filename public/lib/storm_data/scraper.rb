class StormData::Scraper 
  
  def self.scrape(input)
    
    case input.name
    when "Atlantic"
      code = "atlc"
    when "Eastern Pacific"
      code = "epac"
    when "Central Pacific"
      code = "cpac"
    end
    region = Nokogiri::HTML(open("https://www.nhc.noaa.gov/gtwo.php?basin=#{code}&fdays=5"))
    input.prelim = region.css("button").collect{|x| x.text}
    x = region.css("pre").collect{|x| x.text}
    input.supp = x[0].split("\n").drop(4).join("\n")
  end 
 
end 




