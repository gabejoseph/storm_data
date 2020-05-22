class StormData::CLI 
    
  def call
    # StormData::Region.new("Atlantic", "https://www.nhc.noaa.gov/gtwo.php?basin=atlc&fdays=5")
    # StormData::Region.new("Eastern Pacific", "https://www.nhc.noaa.gov/gtwo.php?basin=epac&fdays=5")
    # StormData::Region.new("Central Pacific", "https://www.nhc.noaa.gov/gtwo.php?basin=cpac&fdays=5")
    puts "Welcome to Storm Chasers!"
    puts "Which region would you like to check for activity?"
    puts "Atlantic, Eastern Pacific or Central Pacific? (case-sensitive)"
    userinput = gets.strip
    StormData::Region.new("#{userinput}")
    # blank = StormData::Region.find_by_name(userinput)
    # x = StormData::Scraper.scrape_prelim(blank)
    # prelim_data(x)
  end 
  
  def prelim_data(x)
    if x[1] != "None"
      puts "Registered Disturbances are as follows:"
      puts "#{x.join(" ")}"
    else  
      puts "No Disturbances detected"
    end 
  end 
  
  def supp_data 
    puts "Would you like supplementary data on this region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      StormData::Region.extra(@region)
      restart
    elsif variable == "No" || variable == "no"
      restart
    else
      puts "Invalid reponse, please enter 'Yes or No'"
      supp_data
    end 
  end 
  
  def restart 
    puts "Would you like to check a new region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      StormData::CLI.clear 
      StormData::Scraper.clear
      call
    elsif variable == "No" || variable == "no"
      puts "Thanks for using 'Storm Chasers!'"
    else 
      "Invalid response, please enter 'Yes or No'"
      restart
    end 
  end 
    
end