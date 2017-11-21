require './lib/csv_parser'

class SlcspFinder

  def initialize(locations, plans)
    @rate_areas_by_zip = CsvParser.parse_locations(locations)
    @silver_rates_by_area = CsvParser.parse_plans(plans)
  end

  def execute(zipcodes, output_csv_path)
    CSV.open(output_csv_path, "wb") do |csv_out|
      csv_out << ['zipcode', 'rate']
      CSV.foreach(zipcodes, headers: true) do |row|
        csv_out << [row['zipcode'], find_rate_by_zipcode(row['zipcode'])]
      end
    end
  end

  def find_rate_by_zipcode(zipcode)
    get_second_lowest_rate(get_rates(zipcode))
  end

  private

  def get_rates(zipcode)
    rate_area = @rate_areas_by_zip[zipcode]
    if rate_area && @silver_rates_by_area[rate_area]
      @silver_rates_by_area[rate_area].uniq
    end
  end

  def get_second_lowest_rate(rates)
    if rates && rates.length > 2
      rates.sort[1]
    end
  end
end
