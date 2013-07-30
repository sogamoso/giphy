shared_examples "a Giphy::SpecialGif" do
  describe ".build_batch_from" do
    it "creates a #{@klass} instance for each array element" do
      array = [valid_hash, valid_hash]

      subject = @klass.build_batch_from(array)

      expect(subject.size).to eq array.size

      subject.each do |special_gif|
        expect(special_gif).to be_a @klass
      end
    end
  end

  context "when initialized with a valid hash" do
    subject { @klass.new(valid_hash) }

    its(:create_date) { should eq DateTime.parse(valid_hash['create_date']) }
    its(:gif_id)      { should eq valid_hash['gif_id'] }
  end

  context "when initialized with an empty/invalid hash" do
    subject { @klass.new(invalid_hash) }

    it { expect{ subject.create_date }.to raise_error KeyError }
    it { expect{ subject.gif_id }.to raise_error KeyError }
  end
end
