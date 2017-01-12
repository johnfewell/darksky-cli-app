# coding: utf-8

require 'pry'
class DarkskyCliApp::Weather
attr_accessor :name, :now, :later, :later_desc, :eight_day_desc, :eight_day_days, :now_one_word, :days_temps_max, :days_names, :days_summary, :days_temps_min, :url, :location_lat, :location_lng

  def initialize(name = nil, url =nil)
    # @location = location
    @name = name
    @url = url
    @now = now
    @later = later
    @days_temps_max = []
    @days_temps_min = []
    @days_summary = []
    @days_names = []
    @eight_day_days = []
    # get_geo(location)
    #binding.pry
  end

  # def get_geo(location)
  #   location_search = Geocoder.search(location)
  #   location_result = location_search[0]
  #   self.name = location_result.data["formatted_address"]
  #   self.location_lat = location_result.data["geometry"]["location"]["lat"]
  #   self.location_lng = location_result.data["geometry"]["location"]["lng"]
  #   self.url = "https://www.darksky.net/forecast/" + self.location_lat.to_s + "," + self.location_lng.to_s
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
  end

  def doc
    #binding.pry
    @doc ||= Nokogiri::HTML(open(url))
  end

end
