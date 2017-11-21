require 'csv'

class CsvParser
  def self.parse_locations(filename)
    rate_areas_by_zip = {}
    CSV.foreach(filename, headers: true) do |row|
      zip = row['zipcode']
      rate_area = row['state'].upcase + row['rate_area']
      if rate_areas_by_zip[zip] && rate_areas_by_zip[zip] != rate_area
        rate_areas_by_zip[zip] = nil
      else
        rate_areas_by_zip[zip] = rate_area
      end
    end
    rate_areas_by_zip
  end

  def self.parse_plans(filename)
    silver_rates_by_area = {}
    CSV.foreach(filename, headers: true) do |row|
      metal_level = row['metal_level'].downcase
      rate = row['rate']
      rate_area = row['state'].upcase + row['rate_area']
      if metal_level == 'silver'
        if silver_rates_by_area[rate_area]
          silver_rates_by_area[rate_area] << rate.to_f
        else
          silver_rates_by_area[rate_area] = [rate.to_f]
        end
      end
    end
    silver_rates_by_area
  end
end
