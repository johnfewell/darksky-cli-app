# coding: utf-8

require 'pry'
class DarkskyCliApp::Weather
attr_accessor :name, :now, :later, :later_desc, :eight_day_desc, :eight_day_days, :now_one_word, :days_temps_max, :days_names, :days_summary, :days_temps_min, :url

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @now = now
    @later_desc = later_desc
    @later = later
    @days_temps_max = []
    @days_temps_min = []
    @days_summary = []
    @days_names = []
    @eight_day_days = []
  end

  def today(location)
  #  DarkskyCliApp::Scraper.new.get_page(location)
    self.name = location
    self.now = "#{self.name}: #{self.now_temp} #{self.now_one_word}"
  end

  # def eight_day
  #   days_temps
  #   self.eight_day_desc = "Drizzle on Monday and Friday, with temperatures rising to 77°F on Wednesday."
  #   self.eight_day_days[0] = "☀ Fri H:63 L:49"
  #   self.eight_day_days[1] = "☀ Sat H:65 L:47"
  #   self.eight_day_days[2] = "☁️ Sun H:70 L:50"
  #   self.eight_day_days[3] = "🌧 Mon H:59 L:74"
  #   self.eight_day_days[4] = "⛅ Tue H:76 L:61"
  #   self.eight_day_days[5] = "☀ Wed H:77 L:64"
  #   self.eight_day_days[6] = "☁️ Thu H:69 L:58"
  #   self.eight_day_days[7] = "🌧 Fri H:63 L:57"
  # end

#this is just the number and degree symbol
  def now_temp
    @now_temp = doc.xpath("//span[@class='temp swip']").text
  end
#this is the one word desc of the weather
  def now_one_word
    @now_one_word = doc.xpath("//span[@class='summary swap']").text
  end
#current weather sentance desc
  def later_desc
    @later_desc = doc.xpath("//span[@class='next swap']").text.strip
  end
#later today weather one sentance
  def later
    @later = doc.xpath("//div[@id='nextHourClear']").text.strip
  end

  def days_temps
    @days_temps_max = doc.xpath("//span[@class='maxTemp']").text.split(/\u02DA/)
    @days_temps_max.map! {|x| x + "\u02DA"}
    @days_temps_min = doc.xpath("//span[@class='minTemp']").text.split(/\u02DA/)
    @days_temps_min.map! {|x| x + "\u02DA"}
    @days_names = doc.xpath("//span[@class='name']").text.split(" ")
    @days_summary = doc.xpath("//div[@class='summary']").text.strip.split(".")
    @days_summary.map! {|d| d.strip + "."}

    #binding.pry
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://www.darksky.net/40.7306,-73.9866"))
  end

end
