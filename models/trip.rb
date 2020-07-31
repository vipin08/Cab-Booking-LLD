require './constants'
module ActiveUtility
  class Trip
    include Constant
    # enum status: {in_progress: "in_progress", finished: "finished"}
    attr_reader :cab, :rider, :price, :from, :to, :status
    def initialize cab, rider, price, from, to
      @cab = cab
      @rider = rider
      @price = price
      @from = from
      @to = to
      @status = TRIP_START_STATUS
    end

    def end_trip
      @status = TRIP_END_STATUS
    end
  end
end