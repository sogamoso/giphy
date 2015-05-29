module Giphy
  class Response
    def self.build(response)
      new(response).data
    end

    def initialize(response)
      @response = response
    end

    def data
      raise Giphy::Errors::Unexpected unless response.body
      response.body['data'] || raise(Giphy::Errors::API.new(error))
    end

    private

    attr_reader :response

    def error
      "#{meta['error_type']} #{meta['error_message']}"
    end

    def meta
      @meta ||= response.body.fetch('meta')
    end
  end
end
