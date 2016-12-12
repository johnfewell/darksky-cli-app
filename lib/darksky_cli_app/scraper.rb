class DarkskyCliApp::Scraper

  def get_page(location)
    Weather.url = Nokogiri::HTML(open("https://www.darksky.net/#{location}"))
  end
end
