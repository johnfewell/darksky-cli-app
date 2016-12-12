class DarkskyCliApp::Weather
attr_accessor :name, :now, :later, :now_desc, :hrs, :eight_day_desc, :eight_day_days, :now_one_word, :hrs_temps, :url

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @now = now
    @now_desc = now_desc
    @later = later
    @hrs = []
    @hrs_temps
    @eight_day_days = []
  end

  def today(location)
  #  DarkskyCliApp::Scraper.new.get_page(location)
    self.name = location

    self.now = "#{self.name}: #{self.now_temp} #{self.now_one_word}"
    self.now_desc = @now_desc
    self.later = @later
    self.hrs[0] = "Now: 62˚"
    self.hrs[1] = "6pm: 61˚"
    self.hrs[2] = "8pm: 57˚"
    self.hrs[3] = "10pm: 54˚"
    self.hrs[4] = "12am: 52˚"
    self.hrs[5] = "2am: 50˚"
    self.hrs[6] = "4am: 49˚"
    self.hrs[7] = "6am: 47˚"
    self.hrs[8] = "8am: 48˚"
    self.hrs[9] = "10am: 55˚"
    self.hrs[10] = "12pm: 60˚"
    self.hrs[11] = "2pm: 64˚"
  end

  def eight_day
    self.eight_day_desc = "Drizzle on Monday and Friday, with temperatures rising to 77°F on Wednesday."
    self.eight_day_days[0] = "☀ Fri H:63 L:49"
    self.eight_day_days[1] = "☀ Sat H:65 L:47"
    self.eight_day_days[2] = "☁️ Sun H:70 L:50"
    self.eight_day_days[3] = "🌧 Mon H:59 L:74"
    self.eight_day_days[4] = "⛅ Tue H:76 L:61"
    self.eight_day_days[5] = "☀ Wed H:77 L:64"
    self.eight_day_days[6] = "☁️ Thu H:69 L:58"
    self.eight_day_days[7] = "🌧 Fri H:63 L:57"
  end

#this is just the number and degree symbol
  def now_temp
    @now_temp ||= doc.xpath("//span[@class='temp swip']").text
  end
#this is the one word desc of the weather
  def now_one_word
    @now_one_word ||= doc.xpath("//span[@class='summary swap']").text
  end
#current weather sentance desc
  def now_desc
    @now_desc ||= doc.xpath("//span[@class='next swap']").text
  end
#later today weather one sentance
  def later
    @later ||= doc.xpath("//span[@class='summary swap']").text
  end

  def hrs
    @hrs ||= doc.xpath("//span[@class='hour']").text.split(" ")
  end

  def hrs_temps
    @hrs_temps ||= doc.xpath("//div[@id='timeline']").text.split("˚")
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://www.darksky.net/37.3874,-121.9024"))
  end

end
