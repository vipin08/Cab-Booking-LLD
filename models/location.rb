require './constants'
module ActiveUtility
  class Location
    include Constant
    attr_reader :from, :to
    def initialize from=nil, to=nil
      @from = from
      @to = to
    end

    def update from, to
      @from = from
      @to = to
    end

    def srt_distance(location_2)
      return nil if location_2.nil?
      Math.sqrt((@from-location_2.from)**2 + (@to-location_2.to)**2)
    end

    def find_price(to_point)
      return srt_distance(to_point).to_f * PER_KM_RATE
    end
  end
end