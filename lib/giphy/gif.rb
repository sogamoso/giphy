module Giphy
  class Gif
    def self.build_batch_from(array)
      array.map { |gif| new(gif) }
    end

    def initialize(hash)
      @hash = hash
    end

    def id
      hash.fetch('id')
    end

    def url
      URI(hash.fetch('url', ''))
    end

    def bitly_gif_url
      URI(hash.fetch('bitly_gif_url', ''))
    end

    def bitly_fullscreen_url
      URI(hash.fetch('bitly_fullscreen_url', ''))
    end

    def bitly_tiled_url
      URI(hash.fetch('bitly_tiled_url', ''))
    end

    def embed_url
      URI(hash.fetch('embed_url', ''))
    end

    def fixed_height_image
      @fixed_height_image ||= image(images['fixed_height'])
    end

    def fixed_height_still_image
      @fixed_height_still_image ||= image(images['fixed_height_still'])
    end

    def fixed_height_downsampled_image
      @fixed_height_downsampled_image ||= image(images['fixed_height_downsampled'])
    end

    def fixed_width_image
      @fixed_width_image ||= image(images['fixed_width'])
    end

    def fixed_width_still_image
      @fixed_width_still_image ||= image(images['fixed_width_still'])
    end

    def fixed_width_downsampled_image
      @fixed_width_downsampled_image ||= image(images['fixed_width_downsampled'])
    end

    def original_image
      @original_image ||= image(images['original'])
    end

    def image_original_url
      URI(hash.fetch('image_original_url', ''))
    end

    private

    attr_reader :hash

    def images
      @images ||= hash.fetch('images', {})
    end

    def image(image_hash)
      image_hash ? Giphy::Image.new(image_hash) : null_image
    end

    def null_image
      NullImage.new
    end
  end
end
