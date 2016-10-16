class DarkskyCliApp::Weather

  def today(location)
    puts ""
    puts "----------------------"
    puts "#{location}: 62˚ Clear"
    puts "Clear throughout the day."
    puts "Next Hour: Clear. No precipitation anywhere in the area."
    puts "----------------------"
    puts "Now: 62˚"
    puts "6pm: 61˚"
    puts "8pm: 57˚"
    puts "10pm: 54˚"
    puts "12am: 52˚"
    puts "2am: 50˚"
    puts "4am: 49˚"
    puts "6am: 47˚"
    puts "8am: 48˚"
    puts "10am: 55˚"
    puts "12pm: 60˚"
    puts "2pm: 64˚"
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
