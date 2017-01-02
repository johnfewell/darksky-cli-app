class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    @weather = DarkskyCliApp::Weather.new
    @weather.today(location)
    # DarkskyCliApp::Scraper.new.get_page(location)
    puts ""
    puts "----------------------"
    puts "#{@weather.now} #{@weather.later_desc}"
    puts @weather.later
    puts "----------------------"
    #puts ""

  end

  def ten_day_forecast
    #@weather = DarkskyCliApp::Weather.new.ten_day
    @weather.eight_day
    puts "----------------------"
    puts @weather.days_temps
    puts "----------------------"
    puts @weather.eight_day_days[0]
    puts @weather.eight_day_days[1]
    puts @weather.eight_day_days[2]
    puts @weather.eight_day_days[3]
    puts @weather.eight_day_days[4]
    puts @weather.eight_day_days[5]
    puts @weather.eight_day_days[6]
    puts @weather.eight_day_days[7]
    puts "----------------------"
  end

  def get_geo(location)
    #this will use the geolocation gem
    location
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter a location to get today's weather forecast:"
    input = gets.strip.downcase
    if input == "exit"
      exit
    else
      if get_geo(input) == nil
        puts "Could not find that location, please try another"
      else
        todays_weather(input)
      end
      puts "Do you want the 10 day forecast for this location? y/n"
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
