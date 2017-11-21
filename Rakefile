require './lib/slcsp_finder'

namespace :slcsp do
  finder = SlcspFinder.new('data/zips.csv', 'data/plans.csv')

  desc 'find all slcsps for a given csv of zipcodes'
  task :csv do
    unless ENV.has_key?('ZIPCODES_PATH') && ENV.has_key?('OUTPUT_PATH')
      raise 'Please specify a path for the csv of zipcodes and a path for the output csv, ie `rake slcsp:csv ZIPCODES_PATH="data/slcsp.csv" OUTPUT_PATH="slcsp_rates.csv"`'
    else
      finder.execute(ENV['ZIPCODES_PATH'], ENV['OUTPUT_PATH'])
    end
  end

  desc 'find the slcsp for a given zipcode'
  task :zipcode do
    unless ENV.has_key?('ZIPCODE')
      raise 'Please specify a zipcode, ie `rake slcsp:csv ZIPCODE=20137`'
    else
      puts finder.find_rate_by_zipcode(ENV['ZIPCODE'])
    end
  end
end
