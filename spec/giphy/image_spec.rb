require 'spec_helper'

describe Giphy::Image do
  subject { Giphy::Image.new(hash) }

  context "when initialized with a valid hash" do
    let(:hash)  do
      {"url"    => "http://media0.giphy.com/media/ygsIHxE5xSI4o/original.gif",
       "width"  => "400",
       "height" => "292",
       "size"   => "1013326",
       "frames" => "11"
      }
    end

    its(:url)    { should eq URI("http://media0.giphy.com/media/ygsIHxE5xSI4o/original.gif") }
    its(:width)  { should eq 400 }
    its(:height) { should eq 292 }
    its(:size)   { should eq 1013326 }
    its(:frames) { should eq 11 }
  end

  describe "when initialized with an empty/invalid hash" do
    let(:hash) { {} }

    it { expect{ subject.url }.to raise_error KeyError }
    it { expect{ subject.width }.to raise_error KeyError }
    it { expect{ subject.height }.to raise_error KeyError }
    its(:size) { should eq 0 }
    its(:frames) { should eq 0 }
  end
end
