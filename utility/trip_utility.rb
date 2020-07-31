module Utility
  class TripUtility
    @@trips = {}
    def register trip # register cabs
      id = rand(10)
      @@trips[id] = trip
    end

    def get_all_trips # return all trips
      return @@trips
    end
  end
end