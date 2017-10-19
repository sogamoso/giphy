module Giphy
  module Search
    def trending(options={})
      result = client.trending(options)
      gif.build_batch_from(result)
    end

    def translate(word)
      result = client.translate(word)
      gif.build_batch_from(result)
    end

    def search(keyword, options={})
      result = client.search(keyword, options)
      gif.build_batch_from(result)
    end

    def flag(id)
      result = client.flag(id)
      flagged_gif.new(result)
    end

    def flagged
      result = client.flagged
      flagged_gif.build_batch_from(result)
    end

    def screensaver(tag)
      result = client.screensaver(tag)
      gif.new(result)
    end

    def random(tag='')
      result = client.random(tag)
      random_gif.new(result)
    end

    def gif_by_id(*ids)
      GifByID.new.get(ids)
    end

    private

    def client
      Giphy::Client.new
    end

    def gif
      Giphy::Gif
    end

    def flagged_gif
      Giphy::FlaggedGif
    end

    def random_gif
      Giphy::RandomGif
    end
  end
end
