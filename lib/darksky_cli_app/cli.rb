class DarkskyCliApp::CLI

  def call
    menu
  end

  def todays_weather(location)
    location_search = Geocoder.search(location)
    location_result = location_search[0]
    name = location_result.data["formatted_address"]
    location_lat = location_result.data["geometry"]["location"]["lat"]
    location_lng = location_result.data["geometry"]["location"]["lng"]
    url = "https://www.darksky.net/forecast/" + location_lat.to_s + "," + location_lng.to_s
    @weather = DarkskyCliApp::Weather.new(name, url)
    puts "----------------------"
    puts "#{@weather.name}: #{@weather.now_temp} #{@weather.now_one_word} #{@weather.later_desc}"
    #binding.pry
    puts @weather.later if @weather.later != ""
    puts "----------------------"

  end

  def ten_day_forecast
    #@weather = DarkskyCliApp::Weather.new.ten_day
    @weather.days_temps
    puts "----------------------"
    puts @weather.days_summary[0]
    puts "----------------------"
    puts "#{@weather.days_names[0]} H:#{@weather.days_temps_max[0]} L:#{@weather.days_temps_min[0]} #{@weather.days_summary[1]}"
    puts "#{@weather.days_names[1]} H:#{@weather.days_temps_max[1]} L:#{@weather.days_temps_min[1]} #{@weather.days_summary[2]}"
    puts "#{@weather.days_names[2]} H:#{@weather.days_temps_max[2]} L:#{@weather.days_temps_min[2]} #{@weather.days_summary[3]}"
    puts "#{@weather.days_names[3]} H:#{@weather.days_temps_max[3]} L:#{@weather.days_temps_min[3]} #{@weather.days_summary[4]}"
    puts "#{@weather.days_names[4]} H:#{@weather.days_temps_max[4]} L:#{@weather.days_temps_min[4]} #{@weather.days_summary[5]}"
    puts "#{@weather.days_names[5]} H:#{@weather.days_temps_max[5]} L:#{@weather.days_temps_min[5]} #{@weather.days_summary[6]}"
    puts "#{@weather.days_names[6]} H:#{@weather.days_temps_max[6]} L:#{@weather.days_temps_min[6]} #{@weather.days_summary[7]}"
    puts "#{@weather.days_names[7]} H:#{@weather.days_temps_max[7]} L:#{@weather.days_temps_min[7]} #{@weather.days_summary[8]}"
    puts "----------------------"
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter a location to get today's weather forecast:"
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
