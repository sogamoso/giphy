require 'spec_helper'

describe Giphy::Search do
  class TestObject ; include Giphy::Search ; end

  subject { TestObject.new }

  let(:client)        { double('client') }
  let(:client_result) { double('result') }
  let(:response)      { double('response') }
  let(:options)       { {option: 'option'} }

  before { allow(Giphy::Client).to receive(:new).and_return(client) }

  describe "#trending" do
    it "returns a batch of Gifs from the client result" do
      allow(client).to receive(:trending).with(options).and_return(client_result)
      allow(Giphy::Gif).to receive(:build_batch_from).with(client_result).and_return(response)
      expect(subject.trending(options)).to eq response
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

  describe "#gif_by_id" do
    it "returns a batch of Gifs from the client result" do
      gif_by_id = double
      allow(Giphy::GifByID).to receive(:new).and_return(gif_by_id)
      allow(gif_by_id).to receive(:get).with(['wdsf34df', 'ydfe779f']).and_return(response)
      expect(subject.gif_by_id('wdsf34df', 'ydfe779f')).to eq response
    end
  end
end
