require 'active_record'

class Slcsp < ActiveRecord::Base

  def rate
  end

  private

  def rate_area
    Location.find_rate_area_by_zipcode(zipcode)
  end
end
