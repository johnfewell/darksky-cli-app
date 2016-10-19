class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    @weather = DarkskyCliApp::Weather.new
    @weather.today(location)

    puts ""
    puts "----------------------"
    puts @weather.now
    puts @weather.now_desc
    puts @weather.later
    puts "----------------------"
    puts @weather.hrs[1]
    puts @weather.hrs[2]
    puts @weather.hrs[3]
    puts @weather.hrs[4]
    puts @weather.hrs[5]
    puts @weather.hrs[6]
    puts @weather.hrs[7]
    puts @weather.hrs[8]
    puts @weather.hrs[9]
    puts @weather.hrs[10]
    puts @weather.hrs[11]
    puts @weather.hrs[12]
    puts "----------------------"
    puts ""

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
