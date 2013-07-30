module Giphy
  class GifByID
    def get(ids)
      case ids.size
      when 0
        raise Giphy::Errors::ArgumentError.new('wrong number of arguments (0 for 1...Infinite)')
      when 1
        one_gif(ids.first)
      else
        several_gifs(ids)
      end
    end

    private

    def one_gif(id)
      result = client.gif(id)
      gif.new(result)
    end

    def several_gifs(ids)
      result = client.gifs(ids)
      gif.build_batch_from(result)
    end

    def client
      Giphy::Client.new
    end

    def gif
      Giphy::Gif
    end
  end
end
