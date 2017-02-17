module Bitcodin
  class EncodingProfile

    attr_accessor :values

    # Body parameter building for http://portal.bitcodin.com/api/encoding-profile/create
    # Usage:
    #
    #   profile_config   = Bitcodin::EncodingProfile.new("720-3video-2audio", video_stream_configs, audio_stream_configs)
    #   profile_config.values
    def initialize(name, videoStreamConfigs, audioStreamConfigs)  
      @values = {
        "name" => name,
        "videoStreamConfigs" => map_this(videoStreamConfigs),
        "audioStreamConfigs" => map_this(audioStreamConfigs)
      }.to_json 
    end

    private

    def map_this(configs)
      configs.map{|v| JSON.parse(v.values) }
    end
  end
end
