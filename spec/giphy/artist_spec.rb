require 'spec_helper'

describe Giphy::Artist do
  subject { Giphy::Artist.new(hash) }

  context "when initialized with a valid hash" do
    let(:hash) do
      { 'username' => "frankmacchia",
        "avatar"   => "http://media.giphy.com/avatars/frankmacchia.gif",
        "website"  => "http://frankmacchia.blogspot.com/",
        "name"     => "Frank Macchia",
        "count"    => 7
      }
    end

    its(:username) { should eq "frankmacchia" }
    its(:avatar)   { should eq URI("http://media.giphy.com/avatars/frankmacchia.gif") }
    its(:website)  { should eq URI("http://frankmacchia.blogspot.com/") }
    its(:name)     { should eq "Frank Macchia" }
    its(:count)    { should eq 7 }
   end

  context "when initialized with an empty/invalid hash" do
    let(:hash) { {} }

    it { expect{ subject.username }.to raise_error KeyError }
    it { expect{ subject.avatar }.to raise_error KeyError }
    it { expect{ subject.website }.to raise_error KeyError }
    it { expect{ subject.name }.to raise_error KeyError }
    it { expect{ subject.count }.to raise_error KeyError }
  end
end
