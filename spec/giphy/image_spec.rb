require 'spec_helper'

describe Giphy::Image do
  subject { Giphy::Image.new(hash) }

  context "when initialized with a valid hash" do
    let(:hash)  do
      {"url"       => "http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.gif",
       "width"     => "242",
       "height"    => "245",
       "size"      => "1030890",
       "frames"    => "23",
       "mp4"       => "http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.mp4",
       "mp4_size"  => "186571",
       "webp"      => "http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.webp",
       "webp_size" => "350852"
      }
    end

    its(:url)       { should eq URI("http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.gif") }
    its(:width)     { should eq 242 }
    its(:height)    { should eq 245 }
    its(:size)      { should eq 1_030_890 }
    its(:frames)    { should eq 23 }
    its(:mp4)       { should eq URI("http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.mp4") }
    its(:mp4_size)  { should eq 186_571 }
    its(:webp)      { should eq URI("http://media2.giphy.com/media/yj5oYHjoIwv28/giphy.webp") }
    its(:webp_size) { should eq 350_852 }
  end

  describe "when initialized with an empty/invalid hash" do
    let(:hash) { {} }

    it { expect{ subject.url }.to raise_error KeyError }
    it { expect{ subject.width }.to raise_error KeyError }
    it { expect{ subject.height }.to raise_error KeyError }
    it { expect{ subject.mp4 }.to raise_error KeyError }
    it { expect{ subject.webp }.to raise_error KeyError }
    its(:size) { should eq 0 }
    its(:frames) { should eq 0 }
    its(:mp4_size) { should eq 0 }
    its(:webp_size) { should eq 0 }
  end
end
