require "rubygems"
require "open-uri"
require "nokogiri"
class scrape
		page = Nokogiri::HTML(open("https://www.darksky.net/40.7306,-73.9866")
		file = File.open("scrape.html", 'w')
		file.write(page)
		file.close
end
