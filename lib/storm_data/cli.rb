class StormData::CLI 

  attr_accessor :prelim, :supp
    
  def self.call
    StormData::Region.new("Atlantic")
    StormData::Region.new("Eastern Pacific")
    StormData::Region.new("Central Pacific")
    puts "Welcome to Storm Chasers!"
    puts "Which region would you like to check for activity?"
    puts "Atlantic, Eastern Pacific or Central Pacific? (case-sensitive)"
    userinput = gets.strip
    StormData::Region.find_by_name("#{userinput}")
    prelim_data
  end 
  
  def self.prelim_data
    x = StormData::Region.all
    if x[0].prelim[1] != "None"
      puts "Registered Disturbances are as follows:"
      puts "#{x[0].prelim.join(" ")}"
    else 
      puts "No Disturbances detected"
    end 
    supp_data
  end 
  
  def self.supp_data 
    puts "Would you like supplementary data on this region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      puts StormData::Region.all[0].supp
      #puts StormData::Region.all[0].supp
      restart
    elsif variable == "No" || variable == "no"
      restart
    else
      puts "Invalid reponse, please enter 'Yes or No'"
      supp_data
    end 
  end 
  
  def self.restart 
    puts "Would you like to check a new region?"
    puts "Type 'Yes or No'"
    variable = gets.strip
    if variable == "Yes" || variable == "yes"
      StormData::Region.clear
      call
    elsif variable == "No" || variable == "no"
      puts "Thanks for using 'Storm Chasers!'"
    else 
      "Invalid response, please enter 'Yes or No'"
      restart
    end 
  end 
    
end