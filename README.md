# Giphy

[![Build Status](https://travis-ci.org/sebasoga/giphy.png?branch=master)](https://travis-ci.org/sebasoga/giphy)
[![Code Climate](https://codeclimate.com/github/sebasoga/giphy.png)](https://codeclimate.com/github/sebasoga/giphy)

Because GIFs make life fun! Use [Giphy API](http://api.giphy.com) from your Ruby programs and
command line. Check out [Giphy Labs](http://labs.giphy.com/) for inspiration.

![](http://media.giphy.com/media/GuDQNjS0qJHpe/200.gif)

## Installation

Add this line to your application's Gemfile:

    gem 'giphy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install giphy

## Usage

Set the API `version` and `api_key`:

```ruby
Giphy::Configuration.configure do |config|
  config.version = THE_API_VERSION
  config.api_key = YOUR_API_KEY
end
```

**Important:** Giphy API is currently in public beta. Unless `version` and `api_key` are set
to specific values the default values for the beta period will be used. Check
[Giphy's API](http://labs.giphy.com/) for updates.

That's it, you're ready to have fun!

#### Trending
````ruby
Giphy.trending(limit: 5)
````

#### Translate
````ruby
Giphy.translate('geek')
````

#### Search
````ruby
Giphy.search('funny cat', {limit: 50, offset: 25})
````

#### Flagged
Write
````ruby
Giphy.flag('m5QHf0caAwgMw')
````
Read
````ruby
Giphy.flagged
````

#### Favorites
Write
````ruby
Giphy.favorite('12HoHdqnDxz5NS')
````
Read
````ruby
Giphy.favorites('absurdnoise', {limit: 50, offset: 25})
````

#### Screensaver
````ruby
Giphy.screensaver('surprise')
````

#### Random
````ruby
Giphy.random
````

For getting random gifs with a specific tag:

````ruby
Giphy.random('american psycho')
````

#### Artists
````ruby
Giphy.artists
````

#### GIFs by artist
````ruby
Giphy.gif_by_artist('89a', {limit: 5, offset: 10})
````

#### GIFs by ID
````ruby
Giphy.gif_by_id('feqkVgjJpYtjy', '12HoHdqnDxz5NS', '7rzbxdu0ZEXLy')
````

### Command Line Tool

There is a small command line tool that let's you search for GIFs from the
command line and opens it on your browser. Just for fun.

    $ giphy 'dance'

## Supported Ruby Versions
This library aims to support and is tested against the following Ruby
implementations:

* Ruby 1.9
* Ruby 2.0
* Ruby 2.1

## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Run tests: `rake`
4. Commit your changes: `git commit -am 'Add some feature'`
5. Push to the branch: `git push origin my-new-feature`
6. Create new Pull Request

## License

See [LICENSE](https://github.com/sebasoga/giphy/blob/master/LICENSE.md) for details.
