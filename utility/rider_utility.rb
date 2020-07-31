module Utility
  class RiderUtility
    @@riders = {}
    def register id, name # register rider
      if (@@riders[id].nil?)
        @@riders[id] = Rider.new(id, name)
      else
        raise StandardError.new("Cab Already exist")
      end
      @@riders
    end

    def get_rider id  # return current cab
      if (@@riders[id].nil?)
        raise ArgumentError.new("Rider not exist")
      end
      return @@riders[id]
    end

    def book rider_id, source_x, source_y, dest_x, dest_y # book trip for rider
      rider = get_rider(rider_id)
      trip = CabUtility.new.book(rider, source_x, source_y, dest_x, dest_y)
      if trip
        return "Trip created"
      end
      return "Something went wrong"
    end

    def get_all_riders  # return all cabs
      return @@riders
    end

    def history rider_id
      rider = get_rider(rider_id)
      trips = TripUtility.new.get_all_trips
      rider_trips = trips.values.select {|t| t.rider.id == rider.id}
      if rider_trips.count == 0
        raise ArgumentError.new("No trip found")
      end
      return rider_trips
    end
  end
end