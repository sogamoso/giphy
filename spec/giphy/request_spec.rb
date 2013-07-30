require 'spec_helper'

describe Giphy::Request do
  let(:connection)    { double('connection') }
  let(:get_response)  { double('get_response') }
  let(:post_response) { double('post_response') }

  before do
    Faraday.stub(new: connection)
    Giphy::Configuration.stub(api_key: 'dc6zaTOxFJmzC')
    Giphy::Configuration.stub(version: 'v1')
  end

  describe ".get" do
    it "creates an instance and sends #get to it" do
      instance = double
      Giphy::Request.stub(new: instance)
      instance.stub(:get).with('/path', {}).and_return(get_response)
      expect(Giphy::Request.get('/path', {})).to eq get_response
    end
  end

  describe ".post" do
    it "creates an instance and sends #post to it" do
      instance = double
      Giphy::Request.stub(new: instance)
      instance.stub(:post).with('/path', {}).and_return(get_response)
      expect(Giphy::Request.post('/path', {})).to eq get_response
    end
  end

  describe "#get" do
    it "returns the response of doing a get to an API endpoint" do
      connection.stub(:get).
        with('/v1/gifs/test', {api_key: 'dc6zaTOxFJmzC', option: 'option'}).
        and_return(get_response)
      expect(Giphy::Request.new.get('/test', option: 'option')).to eq get_response
    end
  end

  describe "#post" do
    it "returns the response of doing a post to an API endpoint" do
      connection.stub(:post).
        with('/v1/gifs/test', {api_key: 'dc6zaTOxFJmzC', option: 'option'}).
        and_return(post_response)
      expect(Giphy::Request.new.post('/test', option: 'option')).to eq post_response
    end
  end
end
