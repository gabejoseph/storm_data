class StormData::CLI 
  
  def call 
    puts "Welcome to Storm Chasers!"
    puts "Which region would you like to check for activity?"
    puts "Atlantic, Eastern Pacific or Central Pacific?"
    region = gets.strip
    #Method1(region)
  end 
  
  def method1(region)
    #approrpiate data from scraper
    #returns disturbance and info on disturbance in interpolated string
    #"Would you like to check a different area?"
    #if yes call again, if no "Thanks for using storm chasers!""
  end 
    
end