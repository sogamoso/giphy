require 'spec_helper'

describe Giphy::FavoriteGif do
  let(:invalid_hash) { {} }
  let(:valid_hash) do
    { "gif_id"      => "12HoHdqnDxz5NS",
      "api_key"     => "dc6zaTOxFJmzC",
      "tag"         => "fun",
      "create_date" => "2013-06-21 11:51:46"
    }
  end

  before { @klass = Giphy::FavoriteGif }

  it_should_behave_like "a Giphy::SpecialGif"

  describe "#tag" do
    context "when initialized with a valid hash" do
      subject { Giphy::FavoriteGif.new(valid_hash) }
      its(:tag) { should eq "fun" }
    end

    context "when initialized with an empty/invalid hash" do
      subject { Giphy::FavoriteGif.new(invalid_hash) }
      it { expect{ subject.tag }.to raise_error KeyError }
    end
  end
end
