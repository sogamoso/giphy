require 'launchy'

module Giphy
  class CLI
    def self.run(keyword)
      new(keyword).search
    end

    def initialize(keyword)
      @keyword = keyword
    end

    def search
      system "echo 'Showing the GIF on your browser'"
      Launchy.open(url)
    end

    private

    attr_reader :keyword

    def url
      @url ||= URI("http://giphy.com/embed/#{result.id}")
    end

    def result
      Giphy.screensaver(keyword)
    rescue Giphy::Errors::API
      GifNotFound.new('YyKPbc5OOTSQE')
    end
  end

  GifNotFound = Struct.new(:id)
end
