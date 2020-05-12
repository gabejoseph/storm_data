require_relative "./storm_data/version"
require_relative "./storm_data/cli"
require_relative "./storm_data/scraper"
require "nokogiri"
require "pry"
require "open-uri"

module StormData
  class Error < StandardError; end
  # Your code goes here...
end
