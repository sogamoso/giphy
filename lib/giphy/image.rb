module Giphy
  class Image
    def initialize(hash)
      @hash = hash
    end

    def url
      URI(hash.fetch('url'))
    end

    def width
      hash.fetch('width').to_i
    end

    def height
      hash.fetch('height').to_i
    end

    def size
      hash.fetch('size', 0).to_i
    end

    def frames
      hash.fetch('frames', 0).to_i
    end

    def mp4
      URI(hash.fetch('mp4'))
    end

    def mp4_size
      hash.fetch('mp4_size', 0).to_i
    end

    def webp
      URI(hash.fetch('webp'))
    end

    def webp_size
      hash.fetch('webp_size', 0).to_i
    end

    private

    attr_reader :hash
  end
end
