class DarkskyCliApp::Weather
attr_accessor :name, :now, :later, :now_desc, :hrs

  def initialize
    @name = name
    @now = now
    @now_desc = now_desc
    @later = later
    @hrs = []
  end

  def today(location)
    self.name = location
    self.now = "#{self.name}: 62˚ Clear"
    self.now_desc = "Clear throughout the day."
    self.later = "Next Hour: Clear. No precipitation anywhere in the area."
    self.hrs[1] = "Now: 62˚"
    self.hrs[2] = "6pm: 61˚"
    self.hrs[3] = "8pm: 57˚"
    self.hrs[4] = "10pm: 54˚"
    self.hrs[5] = "12am: 52˚"
    self.hrs[6] = "2am: 50˚"
    self.hrs[7] = "4am: 49˚"
    self.hrs[8] = "6am: 47˚"
    self.hrs[9] = "8am: 48˚"
    self.hrs[10] = "10am: 55˚"
    self.hrs[11] = "12pm: 60˚"
    self.hrs[12] = "2pm: 64˚"
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
