require 'spec_helper'

describe Giphy::Client do
  let(:api_response) { double }
  let(:response)     { double }

  before do
    allow(Giphy::Response).
      to receive(:build).
      with(api_response).
      and_return(response)
  end

  subject { Giphy::Client.new }

  describe "#trending" do
    it "does a GET on the 'trending' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/trending', options: 'options').
        and_return(api_response)
      expect(subject.trending(options: 'options')).to eq response
    end
  end

  describe "#translate" do
    it "does a GET on the 'transalate' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/translate', s: 'word').
        and_return(api_response)
      expect(subject.translate('word')).to eq response
    end
  end

  describe "#search" do
    it "does a GET on the 'search' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/search', {q: 'keyword', options: 'options'}).
        and_return(api_response)
      expect(subject.search('keyword', options: 'options')).to eq response
    end
  end

  describe "#flag" do
    it "does a POST on the 'flagged' endpoint" do
      allow(Giphy::Request).
        to receive(:post).
        with('/12HoHdqnDxz5NS/flagged', {}).
        and_return(api_response)
      expect(subject.flag('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#flagged" do
    it "does a GET on the 'flagged' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/flagged', {}).
        and_return(api_response)
      expect(subject.flagged).to eq response
    end
  end

  describe "#favorite" do
    it "does a POST on the 'favorites' endpoint" do
      allow(Giphy::Request).
        to receive(:post).
        with('/12HoHdqnDxz5NS/favorites', {}).
        and_return(api_response)
      expect(subject.favorite('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#favorites" do
    context "when no username is passed to it" do
      it "does a GET on the 'favorites' endpoint with no username" do
        allow(Giphy::Request).
          to receive(:get).
          with('/favorites', {username: ''}).
          and_return(api_response)
        expect(subject.favorites).to eq response
      end
    end

    context "when a username is passed as an argument" do
      it "does a GET on the 'favorites' endpoint with the username" do
        username = 'absurdnoise'
        allow(Giphy::Request).
          to receive(:get).
          with('/favorites', {username: username}).
          and_return(api_response)
        expect(subject.favorites(username)).to eq response
      end
    end
  end

  describe "#screensaver" do
    it "does a GET on the 'screensaver' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/screensaver', {tag: 'tag'}).
        and_return(api_response)
      expect(subject.screensaver('tag')).to eq response
    end
  end

  describe "#random" do
    context "when no tag is passed to it" do
      it "does a GET on the 'random' endpoint with no tag" do
        allow(Giphy::Request).to receive(:get).
          with('/random', {tag: ''}).
          and_return(api_response)
        expect(subject.random).to eq response
      end
    end

    context "when a tag is passed to it" do
      it "does a GET on the 'random' endpoint with a tag" do
        expect(Giphy::Request).
          to receive(:get).
          with('/random', {tag: 'american psycho'}).
          and_return(api_response)
        expect(subject.random('american psycho')).to eq response
      end
    end
  end

  describe "#artists" do
    it "does a GET on the 'artists' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/artists', {}).
        and_return(api_response)
      expect(subject.artists).to eq response
    end
  end

  describe "#gif" do
    it "does a GET on the 'gif_by_id' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('/12HoHdqnDxz5NS', {}).
        and_return(api_response)
      expect(subject.gif('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#gifs" do
    it "does a GET on the 'artists' endpoint" do
      allow(Giphy::Request).
        to receive(:get).
        with('', {ids: '12HoHdqnDxz5NS,dc6zaTOxFJmzC'}).
        and_return(api_response)
      expect(subject.gifs(['12HoHdqnDxz5NS', 'dc6zaTOxFJmzC'])).to eq response
    end
  end
end
