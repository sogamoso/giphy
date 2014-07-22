require 'spec_helper'

describe Giphy::RandomGif do
  subject { Giphy::RandomGif.new(hash) }

  context "when iniatialized with a valid hash" do
    let(:hash) do
      {
        "type"               => "gif",
        "id"                 => "SWx6sXuaPhUA0",
        "url"                => "http://giphy.com/gifs/SWx6sXuaPhUA0",
        "image_original_url" => "http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.gif",
        "image_url"          => "http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.gif",
        "image_mp4_url"      => "http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.mp4",
        "image_frames"       => "32",
        "image_width"        => "480",
        "image_height"       => "200",
        "rating"             => "g",
        "username"           => "cheezburger",
        "caption"            => "hello",
        "tags"               => [
                                  "cat",
                                  "fall",
                                  "puns",
                                  "box",
                                  "caturday"
                                ]
      }
    end

    its(:id)                   { should eq 'SWx6sXuaPhUA0' }
    its(:url)                  { should eq URI('http://giphy.com/gifs/SWx6sXuaPhUA0') }
    its(:image_original_url)   { should eq URI('http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.gif') }
    its(:image_url)            { should eq URI('http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.gif') }
    its(:image_mp4_url)        { should eq URI('http://s3.amazonaws.com/giphymedia/media/SWx6sXuaPhUA0/giphy.mp4') }
    its(:image_frames)         { should eq '32' }
    its(:image_width)          { should eq '480' }
    its(:image_height)         { should eq '200' }
    its(:rating)               { should eq 'g' }
    its(:username)             { should eq 'cheezburger' }
    its(:caption)              { should eq 'hello' }
    its(:tags)                 { should eq ['cat', 'fall', 'puns', 'box', 'caturday'] }
  end

  context "when initialized with an empty/invalid hash" do
    let(:hash) { {} }

    it { expect{ subject.id }.to raise_error KeyError }
    it { expect{ subject.url }.to raise_error KeyError }
    it { expect{ subject.image_original_url }.to raise_error KeyError }
    it { expect{ subject.image_url }.to raise_error KeyError }
    it { expect{ subject.image_mp4_url }.to raise_error KeyError }
    it { expect{ subject.image_frames }.to raise_error KeyError }
    it { expect{ subject.image_width }.to raise_error KeyError }
    it { expect{ subject.image_height }.to raise_error KeyError }
    it { expect{ subject.rating }.to raise_error KeyError }
    it { expect{ subject.username }.to raise_error KeyError }
    it { expect{ subject.caption }.to raise_error KeyError }
    it { expect{ subject.tags }.to raise_error KeyError }
  end
end
