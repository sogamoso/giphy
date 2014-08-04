ENV["env"] ||= "test"

require 'giphy'
require 'rspec/its'

Dir["./spec/fixtures/*.rb"].each { |f| require f }
Dir["./spec/shared_examples/*.rb"].each { |f| require f }
