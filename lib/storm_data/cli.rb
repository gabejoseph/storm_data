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
    puts "Would you like to check a different area?"
    puts "If so, please type 'yes' to continue, or 'exit' to end program"
    finalresponse = gets.strip
    if finalresponse == "yes" 
      call
    elsif finalresponse == "exit"
      if no "Thanks for using storm chasers!"
    else 
      puts "invalid response"
      call 
    end 
  end 
    
end