class DarkskyCliApp::CLI

  def call
    puts "Hey you!"
    todays_weather
    menu
  end


  def todays_weather
    puts "Today's weather in Brooklyn is 68 degrees"
  end

  def menu
    puts "Do you want the 10 day forcast for this location or do ytou want to find today's weather at a different location?"
  end

end
