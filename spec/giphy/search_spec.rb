require 'spec_helper'

describe Giphy::Search do
  class TestObject ; include Giphy::Search ; end

  subject { TestObject.new }

  let(:client)        { double('client') }
  let(:client_result) { double('result') }
  let(:response)      { double('response') }
  let(:options)       { {option: 'option'} }

  before { allow(Giphy::Client).to receive(:new).and_return(client) }

  describe "#recent" do
    it "returns a batch of Gifs from the client result" do
      allow(client).to receive(:recent).with(options).and_return(client_result)
      allow(Giphy::Gif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.recent(options)).to eq response
    end
  end

  describe "#translate" do
    it "returns a batch of Gifs from the client result" do
      allow(client).to receive(:translate).with('word').and_return(client_result)
      allow(Giphy::Gif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.translate('word')).to eq response
    end
  end

  describe "#search" do
    it "returns a batch of Gifs from the client result" do
      allow(client).to receive(:search).with('keyword', options).and_return(client_result)
      allow(Giphy::Gif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.search('keyword', options)).to eq response
    end
  end

  describe "#flag" do
    it "returns a new FlaggedGif from the client result" do
      allow(client).to receive(:flag).with('wdsf34df').and_return(client_result)
      allow(Giphy::FlaggedGif).to receive(:new).with(client_result).and_return(response)
      expect(subject.flag('wdsf34df')).to eq response
    end
  end

  describe "#flagged" do
    it "returns a batch of FlaggedGifs from the client result" do
      allow(client).to receive(:flagged).and_return(client_result)
      allow(Giphy::FlaggedGif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.flagged).to eq response
    end
  end

  describe "#favorite" do
    it "returns a new FavoriteGifs from the client result" do
      allow(client).to receive(:favorite).with('wdsf34df').and_return(client_result)
      allow(Giphy::FavoriteGif).to receive(:new).with(client_result).and_return(response)
      expect(subject.favorite('wdsf34df')).to eq response
    end
  end

  describe "#favorites" do
    it "returns a batch of FavoriteGifs from the client result" do
      username = 'absurdnoise'
      allow(client).to receive(:favorites).with(username, options).and_return(client_result)
      allow(Giphy::FavoriteGif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.favorites(username, options)).to eq response
    end
  end

  describe "#screensaver" do
    it "returns a new Gif from the client result" do
      allow(client).to receive(:screensaver).with('tag').and_return(client_result)
      allow(Giphy::Gif).to receive(:new).with(client_result).and_return(response)
      expect(subject.screensaver('tag')).to eq response
    end
  end

  describe "#random" do
    context "when no tag is passed to it" do
      it "returns a new Gif from the client result" do
        allow(client).to receive(:random).and_return(client_result)
        allow(Giphy::RandomGif).to receive(:new).with(client_result).and_return(response)
        expect(subject.random).to eq response
      end
    end

    context "when a tag is passed to it" do
      it "returns a new Gif from the client result" do
        allow(client).to receive(:random).with('american psycho').and_return(client_result)
        allow(Giphy::RandomGif).to receive(:new).with(client_result).and_return(response)
        expect(subject.random('american psycho')).to eq response
      end
    end
  end

  describe "#artists" do
    it "returns a batch of Artists from the client result" do
      allow(client).to receive(:artists).and_return(client_result)
      allow(Giphy::Artist).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.artists).to eq response
    end
  end

  describe "#gif_by_artist" do
    it "returns a batch of Gifs from the client result" do
      allow(client).
        to receive(:artists).
        with(username: 'artist_name', option: 'option').
        and_return(client_result)
      allow(Giphy::Gif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.gif_by_artist('artist_name', options)).to eq response
    end
  end

  describe "#gif_by_id" do
    it "returns a batch of Gifs from the client result" do
      gif_by_id = double
      allow(Giphy::GifByID).to receive(:new).and_return(gif_by_id)
      allow(gif_by_id).to receive(:get).with(['wdsf34df', 'ydfe779f']).and_return(response)
      expect(subject.gif_by_id('wdsf34df', 'ydfe779f')).to eq response
    end
  end
end
