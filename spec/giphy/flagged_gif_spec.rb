require 'spec_helper'

describe Giphy::FlaggedGif do
  let(:invalid_hash) { {} }
  let(:valid_hash) do
    { "gif_id"           => "m5QHf0caAwgMw",
      "api_key"          => "dc6zaTOxFJmzC",
      "is_inappropriate" => "0",
      "is_wrong_source"  => "1",
      "source_corrected" => "",
      "create_date"      => "2013-08-01 11:27:20"
    }
  end

  before { @klass = Giphy::FlaggedGif }

  it_should_behave_like "a Giphy::SpecialGif"

  context "when initialized with a valid hash" do
    subject { Giphy::FlaggedGif.new(valid_hash) }

    its(:inappropriate?)   { should be_falsy }
    its(:wrong_source?)    { should be_truthy }
    its(:source_corrected) { should eq "" }
  end

  context "when initialized with an empty/invalid hash" do
    subject { Giphy::FlaggedGif.new(invalid_hash) }

    it { expect{ subject.inappropriate? }.to raise_error KeyError }
    it { expect{ subject.wrong_source? }.to raise_error KeyError }
    it { expect{ subject.source_corrected }.to raise_error KeyError }
  end
end
