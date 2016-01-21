module Bitcodin
  class S3InputConfig

    attr_accessor :values

    def initialize(url:, accessKey: ,secretKey: , bucket:)
      @values = '{
        "type": "s3",
        "accessKey": "' + accessKey + '",
        "secretKey": "' + secretKey + '",
        "bucket": "' + bucket + '",
        "region": "' + region + '",
        "objectKey": "' + url + '",
      }'
    end

  end
end
