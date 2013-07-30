module Giphy
  class NullImage
    def url
      URI('')
    end

    def width
      0
    end

    def height
      0
    end

    def size
      0
    end

    def frames
      0
    end
  end
end
