require 'spec_helper'

describe Giphy::SpecialGif do
  let(:invalid_hash) { {} }
  let(:valid_hash) do
    { "api_key"     => "dc6zaTOxFJmzC",
      "create_date" => "2013-06-21 11:51:46",
      "gif_id"      => "12HoHdqnDxz5NS"
    }
  end

  before { @klass = Giphy::SpecialGif }

  it_should_behave_like "a Giphy::SpecialGif"
end
