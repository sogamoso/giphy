require 'spec_helper'

describe Giphy::CLI do
  describe ".run" do
    it "creates a new instance and sends 'run'" do
      instance = double
      Giphy::CLI.stub(:new).with('keyword').and_return(instance)
      instance.stub(search: 'shell command')
      expect(Giphy::CLI.run('keyword')).to eq 'shell command'
    end
  end

  describe "#search" do
    subject { Giphy::CLI.new('horse') }

    context "when a gif is found" do
      it "echoes a message to the console and opens the url using Kernel#system" do
        Giphy.stub(screensaver: double(id: 'OoFJ7iMGUBpiE'))
        subject.should_receive(:system).
          with("echo 'Showing the GIF on your default browser: http://giphy.com/embed/OoFJ7iMGUBpiE' && open http://giphy.com/embed/OoFJ7iMGUBpiE")
        subject.search
      end
    end

    context "when a Giphy::Errors:API error is raised" do
      it "echoes a message to the console and opens the url using Kernel#system" do
        Giphy.stub(:screensaver).and_raise(Giphy::Errors::API)
        subject.should_receive(:system).
          with("echo 'Showing the GIF on your default browser: http://giphy.com/embed/YyKPbc5OOTSQE' && open http://giphy.com/embed/YyKPbc5OOTSQE")
        subject.search
      end
    end
  end
end
