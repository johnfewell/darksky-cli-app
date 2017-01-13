require 'pry'
class DarkskyCliApp::Weather
attr_accessor :name, :url, :later, :later_desc, :now_one_word, :days_names, :days_temps_max, :days_temps_min, :days_summary

  def initialize(name, url)
    @name = name
    @url = url
    @days_temps_max = []
    @days_temps_min = []
    @days_summary = []
    @days_names = []
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
    @days_temps_max = @doc.xpath("//span[@class='maxTemp']").text.split(/\u02DA/).map! {|x| x + "\u02DA"}
    @days_temps_min = @doc.xpath("//span[@class='minTemp']").text.split(/\u02DA/).map! {|x| x + "\u02DA"}
    @days_names = @doc.xpath("//span[@class='name']").text.split(" ")
    @days_summary = @doc.xpath("//div[@class='summary']").text.strip.gsub! 'in.', 'inches'
    @days_summary = @days_summary.split(".").map! {|x| x.strip + "."}
  end

end
