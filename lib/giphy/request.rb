require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/parse_oj'

module Giphy
  class Request
    URL = 'http://api.giphy.com'

    def self.get(path, options={})
      new.get(path, options)
    end

    def self.post(path, options={})
      new.post(path, options)
    end

    def get(path, options={})
      connection.get(complete_path(path), complete_options(options))
    end

    def post(path, options={})
      connection.post(complete_path(path), complete_options(options))
    end

    private

    attr_reader :api_response

    def connection
      Faraday.new(url: URL) do |connection|
        connection.use FaradayMiddleware::FollowRedirects
        connection.use Faraday::Response::RaiseError
        connection.request :url_encoded
        connection.response :oj
        connection.adapter Faraday.default_adapter
      end
    end

    def version
      configuration.version
    end

    def api_key
      configuration.api_key
    end

    def configuration
      Giphy::Configuration
    end

    def complete_options(options)
      {api_key: api_key}.merge(options)
    end

    def complete_path(path)
      "/#{version}/gifs#{path}"
    end
  end
end
