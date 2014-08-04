require 'spec_helper'

describe Giphy::GifByID do
  subject { Giphy::GifByID.new }

  describe "#get" do
    let(:gif_hash)   { double }
    let(:gif_object) { double }
    let(:client)     { double(gif: gif_hash, gifs: [gif_hash, gif_hash]) }

    before do
      allow(Giphy::Client).to receive(:new).and_return(client)
      allow(Giphy::Gif).to receive(:new).with(gif_hash).and_return(gif_object)
      allow(Giphy::Gif).
        to receive(:build_batch_from).
        with([gif_hash, gif_hash]).
        and_return([gif_object, gif_object])
    end

    describe "#get" do
      context "when ids size is zero" do
        it "raises an ArgumentError" do
          expect{ subject.get([]) }.to raise_error Giphy::Errors::ArgumentError
        end
      end

      context "when ids size is one" do
        it "returns a gif object" do
          expect( subject.get(['jJgZWn8Z2z4Bi']) ).to eq gif_object
        end
      end

      context "when ids size is greates than one" do
        it "returns an array of gift objects" do
          expect( subject.get(['jJgZWn8Z2z4Bi', '3avUsGhmckIYE']) ).to eq [gif_object, gif_object]
        end
      end
    end
  end
end
