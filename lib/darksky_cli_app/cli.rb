class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    #the scrapping will happen here
    puts "Brooklyn: 62˚ Clear"
    puts "Clear throughout the day."
    puts "Next Hour: Clear. No precipitation anywhere in the area."
    puts "Now: 62˚, 6pm: 61˚, 8pm: 57˚, 10pm: 54˚, 12am: 52˚, 2am: 50˚, 4am: 49˚, 6am: 47˚, 8am:48˚, 10am: 55˚, 12pm: 60˚, 2pm: 64˚."
  end

  def ten_day_forecast
    #this will scrape the 10 day forecast
    puts "Drizzle on Monday and Friday, with temperatures rising to 77°F on Wednesday."
    puts "☀ Fri H:63 L:49"
    puts "☀ Sat H:65 L:47"
    puts "☁️ Sun H:70 L:50"
    puts "🌧 Mon H:59 L:74"
    puts "⛅ Tue H:76 L:61"
    puts "☀ Wed H:77 L:64"
    puts "☁️ Thu H:69 L:58"
    puts "🌧 Fri H:63 L:57"
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
