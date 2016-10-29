require 'open-uri'
require 'nokogiri'
require 'pry'

module DarkskyCliApp

  require_relative "darksky_cli_app/version"
  require_relative 'darksky_cli_app/cli'
  require_relative 'darksky_cli_app/weather'
  require_relative 'darksky_cli_app/scraper'

end
