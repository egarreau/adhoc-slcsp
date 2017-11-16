require 'slcsp_finder'

describe SlcspFinder do
  it "has a version number" do
    expect(SlcspFinder::VERSION).not_to be nil
  end

  it "requires a file name" do
    expect(SlcspFinder.run(nil)).to eq "Please include a file name in your call."
  end
end
