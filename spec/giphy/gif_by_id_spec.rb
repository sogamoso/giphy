require 'spec_helper'

describe Giphy::GifByID do
  subject { Giphy::GifByID.new }

  describe "#get" do
    let(:gif_hash)   { double }
    let(:gif_object) { double }
    let(:client)     { double(gif: gif_hash, gifs: [gif_hash, gif_hash]) }

    before do
      Giphy::Client.stub(new: client)
      Giphy::Gif.stub(:new).with(gif_hash).and_return(gif_object)
      Giphy::Gif.stub(:build_batch_from).with([gif_hash, gif_hash]).and_return([gif_object, gif_object])
    end

    describe "#get" do
      context "when ids size is zero" do
        it "raises an ArgumentError and sets its error message" do
          expect{
            subject.get([])
            Giphy::Errors::ArgumentError.should_receive(:new).with('wrong number of arguments (0 for 1...Infinite)')
          }.to raise_error Giphy::Errors::ArgumentError
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
