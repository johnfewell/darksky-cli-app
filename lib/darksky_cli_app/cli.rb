class DarkskyCliApp::CLI

  def call
    menu
    menu2
  end

  def todays_weather(input)
    line_length = []
    @weather = DarkskyCliApp::Weather.new(input)
    current_weather_string = "#{@weather.name}: #{@weather.now_temp} #{@weather.now_one_word} #{@weather.later_desc}"
    later_weather_string = "#{@weather.name}: #{@weather.now_temp} #{@weather.now_one_word} #{@weather.later_desc}"
    line_length << current_weather_string.size / 4
    line_length << later_weather_string.size / 4
    separator = "=---" * (line_length.max + 1) + "="
    puts separator
    puts current_weather_string
    puts later_weather_string if later_weather_string != ""
    puts separator
  end

  def ten_day_forecast
    @weather.days_temps
    puts "=---=---=---=---=---=---=---=---=---=---=---="
    puts @weather.week_summary
    puts "=---=---=---=---=---=---=---=---=---=---=---="
    puts @weather.days_array.transpose.map {|x| x.join(" ")}.join("\n")
    puts "=---=---=---=---=---=---=---=---=---=---=---="
  end

  def menu
    puts " +___  + +___  + +___  + +___  + +___  + +___  + +___  + +___  + +___"
    puts "    _+_+    _+_+    _+_+    _+_+    _+_+    _+_+    _+_+    _+_+    _+"
    puts "_  + +▓█████▄+_▄▄▄ + +___██▀███__ ██ ▄█▀_ ██████_ ██ ▄█▀▓██+ +██▓  + +"
    puts "_+_+  ▒██▀_██▌▒████▄    ▓██+▒ ██▒+██▄█▒ ▒██+   ▒_+██▄█▒ _▒██  ██▒+_+"
    puts " +___ ░██+__█▌▒██+_▀█▄ +▓██_░▄█+▒▓███▄░+░+▓██▄ + ▓███▄░+ +▒██ ██░+___"
    puts "    _+░▓█▄  _▌░██▄▄▄▄██+▒██▀▀█▄+ ▓██_█▄+  ▒ _+██▒▓██_█▄+  ░ ▐██▓░   _+"
    puts "_  + +░▒████▓+_▓█  +▓██▒░██▓ ▒██▒▒██▒+█▄▒██████▒▒▒██▒+█▄_ ░+██▒▓░  + +"
    puts "_+_+   ▒▒▓_+▒  ▒▒+_+▓▒█░░+▒▓ ░▒▓░▒_▒▒ ▓▒▒+▒▓▒ ▒ ░▒_▒▒ ▓▒_+_██▒▒▒_+_+"
    puts " +___  ░ ▒__▒  +▒+__▒▒ ░ +░▒_░ ▒░░_░▒ ▒░░+░▒_ ░+░░_░▒ ▒░ ▓██_░▒░ +___"
    puts "    _+_░ ░  ░+_+░   ▒+_+  ░░_+_░ ░ ░░+░+░  ░_+░+ ░ ░░+░+ ▒ ▒_░░+    _+"
    puts "_  + +___░ + +___  +░+_░_  ░ +___░ +░+___  + +░__░ +░+___░ ░ +___  + +"
    puts "_+_+   ░_+_+    _+_+    _+_+    _+_+    _+_+    _+_+    _░_░    _+_+"
    def menu2
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
            menu2
          end
        end
      end
    end
  end
end
