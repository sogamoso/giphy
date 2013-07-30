module Giphy
  class Gif
    def self.build_batch_from(array)
      array.map { |gif| new(gif)}
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
      @fixed_height_image ||= images['fixed_height'] ? image(images['fixed_height']) : null_image
    end

    def fixed_height_still_image
      @fixed_height_still_image ||= images['fixed_height_still'] ? image(images['fixed_height_still']) : null_image
    end

    def fixed_height_downsampled_image
      @fixed_height_downsampled_image ||= images['fixed_height_downsampled'] ? image(images['fixed_height_downsampled']) : null_image
    end

    def fixed_width_image
      @fixed_width_image ||= images['fixed_width'] ? image(images['fixed_width']) : null_image
    end

    def fixed_width_still_image
      @fixed_width_still_image ||= images['fixed_width_still'] ? image(images['fixed_width_still']) : null_image
    end

    def fixed_width_downsampled_image
      @fixed_width_downsampled_image ||= images['fixed_width_downsampled'] ? image(images['fixed_width_downsampled']) : null_image
    end

    def original_image
      @original_image ||= images['original'] ? image(images['original']) : null_image
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
      Giphy::Image.new(image_hash)
    end

    def null_image
      NullImage.new
    end
  end
end
