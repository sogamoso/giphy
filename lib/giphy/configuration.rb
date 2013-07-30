module Giphy
  class Configuration
    DEFAULT_VERSION  = 'v1'
    DEFAULT_API_KEY  = 'dc6zaTOxFJmzC'

    class << self
      attr_writer :version, :api_key

      def configure(&block)
        yield self
        self
      end

      def version
        @version ||= DEFAULT_VERSION
      end

      def api_key
        @api_key ||= DEFAULT_API_KEY
      end
    end
  end
end
