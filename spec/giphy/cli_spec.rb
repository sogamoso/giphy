require 'spec_helper'
require 'launchy'

describe Giphy::CLI do
  describe ".run" do
    it "creates a new instance and sends 'run'" do
      instance = double
      allow(Giphy::CLI).to receive(:new).with('keyword').and_return(instance)
      allow(instance).to receive(:search).and_return('shell command')
      expect(Giphy::CLI.run('keyword')).to eq 'shell command'
    end
  end

  describe "#search" do
    subject { Giphy::CLI.new('horse') }

    context "when a gif is found" do
      before do
        allow(Giphy).
          to receive(:screensaver).
          and_return(double(id: 'OoFJ7iMGUBpiE'))
      end

      it "echoes a message to the console and opens the url using Kernel#system" do
        expect(subject).
          to receive(:system).
          with("echo 'Showing the GIF on your browser'")
        subject.search
      end

      it "opens the url using Launchy" do
        uri = URI("http://giphy.com/embed/OoFJ7iMGUBpiE")
        expect(Launchy).to receive(:open).with(uri)
        subject.search
      end
    end

    context "when a Giphy::Errors:API error is raised" do
      before { allow(Giphy).to receive(:screensaver).and_raise(Giphy::Errors::API) }

      it "echoes a message to the console and opens the url using Kernel#system" do
        expect(subject).to receive(:system).
          with("echo 'Showing the GIF on your browser'")
        subject.search
      end

      it "opens the 404 gif url using Launchy" do
        uri = URI("http://giphy.com/embed/YyKPbc5OOTSQE")
        expect(Launchy).to receive(:open).with(uri)
        subject.search
      end
    end
  end
end
