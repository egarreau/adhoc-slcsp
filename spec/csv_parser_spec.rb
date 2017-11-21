require 'csv_parser'

describe CsvParser do
  it 'returns a hash of zipcodes and rate areas' do
    hash = {
      "36749" => nil,
      "35456" => nil,
      "35034" => "AL3",
      "36003" => "AL11",
      "85349" => "AZ3",
      "85336" => "AZ3"
    }
    expect(described_class.parse_locations('test_data/zips.csv')).to eq hash
  end

  it 'returns a hash of rate areas and plan rate arrays' do
    hash = {
      "AL3"  => [298.62, 421.43],
      "AL11" => [310.12,310.12,310.12],
      "WI14" => [353.37],
      "GA13" => [285.0],
      "AZ3" => [264.46,348.73,321.99,262.93] 
    }
    expect(described_class.parse_plans('test_data/plans.csv')).to eq hash
    
  end
end 
