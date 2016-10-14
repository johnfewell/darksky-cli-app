class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    #the scrapping will happen here
    puts "Today's weather in #{location} is 68 degrees"
  end

  def ten_day_forecast
    #this will scrape the 10 day forecast
  end

  def get_geo(location)
    #this will use the geolocation gem
    location
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter a location to get today's weather forcast:"
    input = gets.strip.downcase
    if check_location(input) == nil
      puts "Could not find that location, please try another"
    puts "Do you want the 10 day forcast for this location or do ytou want to find today's weather at a different location?"
  end

end
