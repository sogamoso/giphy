require "uri"

current_path = File.expand_path("../", __FILE__)
Dir["#{current_path}/**/*.rb"].each { |file| require file }

module Giphy
  extend Giphy::Search
end
