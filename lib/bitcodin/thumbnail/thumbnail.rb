module Bitcodin
  class Thumbnail

    attr_accessor :values

    def initialize(job_id, height, position, filename)
      @values = {
        :jobId => job_id,
        :height => height,
        :position => position,
        :filename => filename
      }.to_json
    end

  end
end
