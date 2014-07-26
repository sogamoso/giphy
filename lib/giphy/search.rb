module Giphy
  module Search
    def recent(options={})
      result = client.recent(options)
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

    def favorite(id)
      result = client.favorite(id)
      favorite_gif.new(result)
    end

    def favorites(username, options)
      result = client.favorites(username, options)
      favorite_gif.build_batch_from(result)
    end

    def screensaver(tag)
      result = client.screensaver(tag)
      gif.new(result)
    end

    def random(tag='')
      result = client.random(tag)
      random_gif.new(result)
    end

    def artists
      result = client.artists
      artist.build_batch_from(result)
    end

    def gif_by_artist(username, options={})
      options_hash = {username: username}.merge(options)
      result = client.artists(options_hash)
      gif.build_batch_from(result)
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

    def favorite_gif
      Giphy::FavoriteGif
    end

    def random_gif
      Giphy::RandomGif
    end

    def artist
      Giphy::Artist
    end
  end
end
