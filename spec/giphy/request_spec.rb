require 'spec_helper'

describe Giphy::Request do
  let(:connection)    { double('connection') }
  let(:get_response)  { double('get_response') }
  let(:post_response) { double('post_response') }

  before do
    allow(Faraday).to receive(:new).and_return(connection)
    allow(Giphy::Configuration).to receive(:api_key).and_return('dc6zaTOxFJmzC')
    allow(Giphy::Configuration).to receive(:version).and_return('v1')
  end

  describe ".get" do
    it "creates an instance and sends #get to it" do
      instance = double
      allow(Giphy::Request).to receive(:new).and_return(instance)
      allow(instance).to receive(:get).with('/path', {}).and_return(get_response)
      expect(Giphy::Request.get('/path', {})).to eq get_response
    end
  end

  describe ".post" do
    it "creates an instance and sends #post to it" do
      instance = double
      allow(Giphy::Request).to receive(:new).and_return(instance)
      allow(instance).to receive(:post).with('/path', {}).and_return(get_response)
      expect(Giphy::Request.post('/path', {})).to eq get_response
    end
  end

  describe "#get" do
    it "returns the response of doing a get to an API endpoint" do
      allow(connection).
        to receive(:get).
        with('/v1/gifs/test', {api_key: 'dc6zaTOxFJmzC', option: 'option'}).
        and_return(get_response)
      expect(Giphy::Request.new.get('/test', option: 'option')).to eq get_response
    end
  end

  describe "#post" do
    it "returns the response of doing a post to an API endpoint" do
      allow(connection).
        to receive(:post).
        with('/v1/gifs/test', {api_key: 'dc6zaTOxFJmzC', option: 'option'}).
        and_return(post_response)
      expect(Giphy::Request.new.post('/test', option: 'option')).to eq post_response
    end
  end
end
