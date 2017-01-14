require 'pry'
class DarkskyCliApp::Weather
attr_accessor :name, :later, :later_desc, :now_one_word, :days_names, :days_temps_max, :days_temps_min, :days_summary, :input, :url

  def initialize(input)
    @name = name
    @input = input
    @url = url
    @days_temps_max = []
    @days_temps_min = []
    @days_summary = []
    @days_names = []
    get_geo(input)
  end

  def get_geo(input)
    location_search = Geocoder.search(input)
    location_result = location_search[0]
    @name = location_result.data["formatted_address"]
    location_lat = location_result.data["geometry"]["location"]["lat"]
    location_lng = location_result.data["geometry"]["location"]["lng"]
    @url = "https://www.darksky.net/forecast/" + location_lat.to_s + "," + location_lng.to_s
    get_page(url)
  end

#gets the page from the web
  def get_page(url)
    @doc = Nokogiri::HTML(open(url))
  end

#this is only the number and degree symbol
  def now_temp
    @now_temp = @doc.xpath("//span[@class='temp swip']").text
  end

#this is the one word desc of the current weather
  def now_one_word
    @now_one_word = @doc.xpath("//span[@class='summary swap']").text
  end

#current weather sentance desc
  def later_desc
    @later_desc = @doc.xpath("//span[@class='next swap']").text.strip
  end

#later today weather one sentance
  def later
    @later = @doc.xpath("//div[@id='nextHourClear']").text.strip
  end

  def days_temps
    @days_temps_max = @doc.xpath("//span[@class='maxTemp']").text.split(/\u02DA/).map! {|x| "H:" + x + "\u02DA"}
    @days_temps_min = @doc.xpath("//span[@class='minTemp']").text.split(/\u02DA/).map! {|x| "L:" + x + "\u02DA"}
    @days_names = @doc.xpath("//span[@class='name']").text.split(" ")
    @days_summary = @doc.xpath("//div[@class='summary']").text
    if @days_summary.include?(" in.")
      @days_summary = @days_summary.strip.gsub 'in.', 'inches'
    end
    @days_summary = @days_summary.split(".").map! {|x| x.strip + "."}
  end

end
