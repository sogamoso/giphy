require 'date'

module Giphy
  class SpecialGif
    def self.build_batch_from(array)
      array.map { |special_gif| new(special_gif)}
    end

    def initialize(hash)
      @hash = hash
    end

    def create_date
      DateTime.parse(hash.fetch('create_date'))
    end

    def gif_id
      hash.fetch('gif_id')
    end

    private

    attr_reader :hash
  end
end
