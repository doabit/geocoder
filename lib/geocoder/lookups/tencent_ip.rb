require 'geocoder/lookups/tencent'
require 'geocoder/results/tencent_ip'

module Geocoder::Lookup
  class TencentIp < Tencent

    def name
      'Tencent IP'
    end

    private # ---------------------------------------------------------------

    def base_query_url(query)
      'https://apis.map.qq.com/ws/location/v1/ip?'
    end

    def content_key
      'result'
    end

    def query_url_params(query)
      {
        :ip => query.sanitized_text,
        :key => configuration.api_key,
        :output => 'json'
      }.merge(super)
    end
  end
end
