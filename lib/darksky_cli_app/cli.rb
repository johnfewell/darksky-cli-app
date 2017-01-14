class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(input)
    # url = get_geo(input)
    @weather = DarkskyCliApp::Weather.new(input)
    puts "----------------------"
    puts "#{@weather.name}: #{@weather.now_temp} #{@weather.now_one_word} #{@weather.later_desc}"
    puts @weather.later if @weather.later != ""
    puts "----------------------"
  end

  def ten_day_forecast
    @weather.days_temps
    week_summary = @weather.days_summary.shift 
    days_array = []
    days_array << @weather.days_names
    days_array << @weather.days_temps_max
    days_array << @weather.days_temps_min
    days_array << @weather.days_summary
    puts "----------------------"
    puts week_summary
    puts "----------------------"
    puts days_array.transpose.map {|x| x.join(" ")}.join("\n")
    puts "----------------------"
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter a location to get today's weather forecast. (type exit to quit)"
    input = gets.strip.downcase
    if input == "exit"
      exit
    else
      todays_weather(input)
    end
      puts "Do you want the 8 day forecast for this location? y/n"
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
