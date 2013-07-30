require 'giphy/special_gif'

module Giphy
  class FavoriteGif < Giphy::SpecialGif
    def tag
      hash.fetch('tag')
    end
  end
end
