class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    @weather = DarkskyCliApp::Weather.new.today(location)
  end

  def ten_day_forecast
    @weather = DarkskyCliApp::Weather.new.ten_day
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
    if input == "exit"
      exit
    else
      if get_geo(input) == nil
        puts "Could not find that location, please try another"
      else
        todays_weather(input)
      end
      puts "Do you want the 10 day forcast for this location? y/n"
      input = gets.strip.downcase
      if input == "y"
        ten_day_forecast
      elsif input == "n"
        puts "Do you want to exit? y/n"
        input = gets.strip.downcase
        if input == "y"
          exit
        else
          menu
        end
      end
    end
  end
end

end
