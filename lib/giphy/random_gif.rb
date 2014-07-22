module Giphy
  class RandomGif
    def initialize(hash)
      @hash = hash
    end

    def id
      hash.fetch('id')
    end

    def url
      URI(hash.fetch('url'))
    end

    def image_original_url
      URI(hash.fetch('image_original_url'))
    end

    def image_url
      URI(hash.fetch('image_url'))
    end

    def image_mp4_url
      URI(hash.fetch('image_mp4_url'))
    end

    def image_frames
      hash.fetch('image_frames')
    end

    def image_width
      hash.fetch('image_width')
    end

    def image_height
      hash.fetch('image_height')
    end

    def rating
      hash.fetch('rating')
    end

    def username
      hash.fetch('username')
    end

    def caption
      hash.fetch('caption')
    end

    def tags
      hash.fetch('tags')
    end

    private

    attr_reader :hash
  end
end
