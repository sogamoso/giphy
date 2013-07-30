require 'spec_helper'

describe Giphy::CLI do
  describe "#search" do
    subject { Giphy::CLI.new('horse') }

    before { Giphy.stub(screensaver: double(id: 'OoFJ7iMGUBpiE')) }

    it "echoes a message to the console and opens the url using Kernel#system" do
      Giphy.stub(screensaver: double(id: 'OoFJ7iMGUBpiE'))
      Giphy::CLI.new('horse')
      subject.should_receive(:system).
        with("echo 'Showing the GIF on your default browser: http://giphy.com/embed/OoFJ7iMGUBpiE' && open http://giphy.com/embed/OoFJ7iMGUBpiE")
      subject.search
    end
  end
end
