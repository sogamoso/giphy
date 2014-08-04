require 'date'
require 'giphy/special_gif'

module Giphy
  class FlaggedGif < Giphy::SpecialGif
    def inappropriate?
      puts hash.fetch('is_inappropriate')
      hash.fetch('is_inappropriate') == "1"
    end

    def wrong_source?
      hash.fetch('is_wrong_source') == "1"
    end

    def source_corrected
      hash.fetch('source_corrected')
    end
  end
end
