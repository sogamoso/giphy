require 'spec_helper'

describe Giphy::Response do
  describe ".build" do
    it "creates an instance and calls #data on it" do
      data = double
      response = double(data: data)
      allow(Giphy::Response).to receive(:new).and_return(response)
      expect(Giphy::Response.build({})).to eq data
    end
  end

  describe "#data" do
    let(:response) { double(body: hash) }
    subject { Giphy::Response.new(response) }

    context "when response contains 'data'" do
      let(:hash) { {'data' => 'data'} }

      it "returns the 'data' value" do
        expect(subject.data).to eq 'data'
      end
    end

    context "when response does not contain 'data'" do
      let(:hash) do
        { 'meta' =>
          { 'error_type'    => 403,
            'code'          => 403,
            'error_message' => 'Forbidden'
          }
        }
      end

      it "raises an error and sets its message" do
        expect{ subject.data }.to raise_error Giphy::Errors::API
      end
    end

    context "when response is empty" do
      let(:hash) { nil }

      it "raises an error and sets its message" do
        expect{ subject.data }.to raise_error Giphy::Errors::Unexpected
      end
    end

  end
end
