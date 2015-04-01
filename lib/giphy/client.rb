module Giphy
  class Client
    def trending(options={})
      get('/trending', options)
    end

    def translate(word)
      get('/translate', s: word)
    end

    def search(keyword, options={})
      options_hash = {q: keyword}.merge(options)
      get('/search', options_hash)
    end

    def flag(id)
      post("/#{id}/flagged")
    end

    def flagged
      get('/flagged')
    end

    def favorite(id)
      post("/#{id}/favorites")
    end

    def favorites(username='', options={})
      options_hash = {username: username}.merge(options)
      get('/favorites', options_hash)
    end

    def screensaver(tag)
      get('/screensaver', tag: tag)
    end

    def random(tag='')
      get('/random', { tag: tag })
    end

    def artists(options={})
      get('/artists', options)
    end

    def gif(id)
      get("/#{id}")
    end

    def gifs(ids)
      get('', ids: ids.join(','))
    end

    private

    def get(path, options={})
      api_response = request.get(path, options)
      response(api_response)
    end

    def post(path, options={})
      api_response = request.post(path, options)
      response(api_response)
    end

    def request
      Giphy::Request
    end

    def response(api_response)
      Giphy::Response.build(api_response)
    end
  end
end
