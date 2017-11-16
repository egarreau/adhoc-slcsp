require 'models/slcsp'

describe Slcsp do
  let(:zipcode) { "20137" }
  subject { described_class.create(zipcode: zipcode) }

  it "finds rate based on zipcode" do
    expect(subject.rate).to eq "300"
  end
end
