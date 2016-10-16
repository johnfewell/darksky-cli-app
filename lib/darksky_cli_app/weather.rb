class DarkskyCliApp::Weather
attr_accessor :name, :now, :later, :now_desc, :hr1, :hr2, :hr3, :hr4, :hr5, :hr6, :hr7, :hr8, :hr9, :hr10, :hr11, :hr12

  def today(location)
    weather_here = self
    weather_here.name = location
    weather_here.now = "#{weather_here.name}: 62˚ Clear"
    weather_here.now_desc = "Clear throughout the day."
    weather_here.later = "Next Hour: Clear. No precipitation anywhere in the area."
    weather_here.hr1 = "Now: 62˚"
    weather_here.hr2 = "6pm: 61˚"
    weather_here.hr3 = "8pm: 57˚"
    weather_here.hr4 = "10pm: 54˚"
    weather_here.hr5 = "12am: 52˚"
    weather_here.hr6 = "2am: 50˚"
    weather_here.hr7 = "4am: 49˚"
    weather_here.hr8 = "6am: 47˚"
    weather_here.hr9 = "8am: 48˚"
    weather_here.hr10 = "10am: 55˚"
    weather_here.hr11 = "12pm: 60˚"
    weather_here.hr12 = "2pm: 64˚"

    puts ""
    puts "----------------------"
    puts weather_here.now
    puts weather_here.now_desc
    puts weather_here.later
    puts "----------------------"
    puts weather_here.hr1
    puts weather_here.hr2
    puts weather_here.hr3
    puts weather_here.hr4
    puts weather_here.hr5
    puts weather_here.hr6
    puts weather_here.hr7
    puts weather_here.hr8
    puts weather_here.hr9
    puts weather_here.hr10
    puts weather_here.hr11
    puts weather_here.hr12
    puts "----------------------"
    puts ""
  end

  def ten_day
    puts "----------------------"
    puts "Drizzle on Monday and Friday, with temperatures rising to 77°F on Wednesday."
    puts "----------------------"
    puts "☀ Fri H:63 L:49"
    puts "☀ Sat H:65 L:47"
    puts "☁️ Sun H:70 L:50"
    puts "🌧 Mon H:59 L:74"
    puts "⛅ Tue H:76 L:61"
    puts "☀ Wed H:77 L:64"
    puts "☁️ Thu H:69 L:58"
    puts "🌧 Fri H:63 L:57"
    puts "----------------------"
  end

end
