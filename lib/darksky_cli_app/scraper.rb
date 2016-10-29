class DarkskyCliApp::Scraper

  def get_page(location)
    doc = Nokogiri::HTML(open("https://www.darksky.net/#{location}"))
    #binding.pry
  end
end
