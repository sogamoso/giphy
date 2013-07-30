module Giphy
  class Artist
    def self.build_batch_from(array)
      array.map { |artist| new(artist) }
    end

    def initialize(hash)
      @hash = hash
    end

    def username
      hash.fetch('username')
    end

    def avatar
      URI(hash.fetch('avatar'))
    end

    def website
      URI(hash.fetch('website'))
    end

    def name
      hash.fetch('name')
    end

    def count
      hash.fetch('count').to_i
    end

    private

    attr_reader :hash
  end
end
