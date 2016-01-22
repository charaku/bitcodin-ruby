module Bitcodin
  class S3InputConfig

    attr_accessor :values

    def initialize(key:, accessKey: ,secretKey: , bucket:, region:)
      @values = {
        :type => "s3",
        :accessKey => "#{accessKey}",
        :secretKey => "#{secretKey}",
        :bucket => "#{bucket}",
        :region => "#{region}",
        :objectKey => "#{key}",
      }.to_json
    end

  end
end
