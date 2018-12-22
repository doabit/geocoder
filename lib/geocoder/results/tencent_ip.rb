require 'geocoder/results/base'

module Geocoder::Result
  class TencentIp < Base
    def coordinates
      [point['lat'].to_f, point['lng'].to_f]
    end

    def address
      "#{province}#{city}#{district}#{street}#{street_number}"
    end

    def state
      province
    end

    def province
      address_detail['province']
    end

    def city
      address_detail['city']
    end

    def district
      address_detail['district']
    end

    def street
      ""
    end

    def street_number
      ''
    end

    def state_code
      ''
    end

    def postal_code
      ''
    end

    def country
      'China'
    end

    def country_code
      'CN'
    end

    private
    def address_detail
      @data['ad_info']
    end

    def point
      @data['location']
    end
  end
end
