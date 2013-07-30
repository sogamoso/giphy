require 'spec_helper'

describe Giphy::Gif do
  let(:invalid_hash) { {} }
  let(:valid_hash) do
    { "type" => "gif",
      "id"                   => "Pvbwe3TghH6ko",
      "url"                  => "http://giphy.com/gifs/Pvbwe3TghH6ko",
      "bitly_gif_url"        => "http://gph.is/18MZ2ya",
      "bitly_fullscreen_url" => "http://gph.is/18MZ2yc",
      "bitly_tiled_url"      => "http://gph.is/18MZ2ye",
      "embed_url"            => "http://giphy.com/embed/Pvbwe3TghH6ko",
      "images"               => {
        "fixed_height"             => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200_d.gif",
          "width"  => "313",
          "height" => "200"
        },
        "fixed_height_still"       => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200_d.gif",
          "width"  => "313",
          "height" => "200"
        },
        "fixed_height_downsampled" => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200_d.gif",
          "width"  => "313",
          "height" => "200"
        },
        "fixed_width"              => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200w_d.gif",
          "width"  => "200",
          "height" => "128"
        },
        "fixed_width_still"        => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200w_d.gif",
          "width"  => "200",
          "height" => "128"
        },
        "fixed_width_downsampled"  => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/200w_d.gif",
          "width"  => "200",
          "height" => "128"
        },
        "original" => {
          "url"    => "http://media0.giphy.com/media/Pvbwe3TghH6ko/giphy.gif",
          "width"  => "400",
          "height" => "256",
          "size"   => "1477042",
          "frames" => "21"
        }
      }
    }
  end

  describe ".build_batch_from" do
    it "creates a Giphy::Gif instance for each array element" do
      array   = [valid_hash, invalid_hash]
      subject = Giphy::Gif.build_batch_from(array)

      expect(subject.size).to eq array.size

      subject.each do |special_gif|
        expect(special_gif).to be_a Giphy::Gif
      end
    end
  end

  context "when iniatialized with a valid hash" do
    subject { Giphy::Gif.new(valid_hash) }

    its(:id)                   { should eq 'Pvbwe3TghH6ko' }
    its(:url)                  { should eq URI('http://giphy.com/gifs/Pvbwe3TghH6ko') }
    its(:bitly_gif_url)        { should eq URI('http://gph.is/18MZ2ya') }
    its(:bitly_fullscreen_url) { should eq URI('http://gph.is/18MZ2yc') }
    its(:bitly_tiled_url)      { should eq URI('http://gph.is/18MZ2ye') }
    its(:embed_url)            { should eq URI('http://giphy.com/embed/Pvbwe3TghH6ko') }
  end

  context "when initialized with an empty/invalid hash" do
    subject { Giphy::Gif.new(invalid_hash) }

    it { expect{ subject.id }.to raise_error KeyError }
    its(:url)                  { should eq URI('') }
    its(:bitly_gif_url)        { should eq URI('') }
    its(:bitly_fullscreen_url) { should eq URI('') }
    its(:bitly_tiled_url)      { should eq URI('') }
    its(:embed_url)            { should eq URI('') }
  end
end
