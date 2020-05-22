class StormData::CLI 

  attr_accessor :prelim, :supp
    
  def call
    puts "Welcome to Storm Chasers!"
    puts "Which region would you like to check for activity?"
    puts "Atlantic, Eastern Pacific or Central Pacific? (case-sensitive)"
    userinput = gets.strip
    StormData::Region.new("#{userinput}")
    prelim_data
    # blank = StormData::Region.find_by_name(userinput)
    # x = StormData::Scraper.scrape_prelim(blank)
    # prelim_data(x)
  end 
  
  def prelim_data
    x = StormData::Region.all
    if x[0].prelim[1] != "None"
      puts "Registered Disturbances are as follows:"
      puts "#{x[0].prelim.join(" ")}"
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