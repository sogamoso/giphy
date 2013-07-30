module Giphy
  class CLI
    def initialize(keyword)
      @keyword = keyword
    end

    def search
      system "echo 'Showing the GIF on your default browser: #{url}' && open #{url}"
    end

    private

    attr_reader :keyword

    def url
      @url ||= URI("http://giphy.com/embed/#{result.id}")
    end

    def result
      Giphy.screensaver(keyword)
    end
  end
end
