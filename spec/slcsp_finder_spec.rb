require 'slcsp_finder'

describe SlcspFinder do
  let(:good_rate_zipcode) { '85336' }
  let(:nil_rate_zipcode) { '36749' }
  let(:duplicate_rate_zipcode) { '36003' }
  let(:too_few_rates_zipcode) { '35034' } 
  let(:csv_path) { 'test.csv' }

  subject { described_class.new('test_data/zips.csv', 'test_data/plans.csv') }

  context '#execute' do

    after do
      if File.exist?(csv_path)
        File.delete(csv_path)
      end
    end

    it 'creates a new csv' do
      subject.execute('test_data/slcsp.csv', csv_path)
      expect(File.exist?(csv_path)).to be true
    end
  end

  context '#find_by_zipcode' do
    it 'returns the second lowest silver rate for a given zipcode' do
      expect(subject.find_rate_by_zipcode(good_rate_zipcode)).to eq 264.46 
    end

    it 'does not return duplicate rates' do
      expect(subject.find_rate_by_zipcode(duplicate_rate_zipcode)).to eq nil
    end

    it 'does not return rates for a zipcode without a service area' do
      expect(subject.find_rate_by_zipcode(nil_rate_zipcode)).to eq nil
    end

    it 'does not return a rate if the array has fewer than three rates' do
      expect(subject.find_rate_by_zipcode(too_few_rates_zipcode)).to eq nil
    end
  end
end
