ENV["env"] ||= "test"

require 'giphy'

Dir["./spec/fixtures/*.rb"].each { |f| require f }
Dir["./spec/shared_examples/*.rb"].each { |f| require f }