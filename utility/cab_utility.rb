require './models/cab'
require './constants'

module Utility
  class CabUtility
    include Constant
    @@cabs = {} # make in memory hash
    def register id, name # register cabs
      if (@@cabs[id].nil?)
        @@cabs[id] = Cab.new(id, name)
      else
        raise "Cab Already exist"
      end
      @@cabs
    end

    def update_location id, from, to # update cab location
      cab = get_cab(id)
      cab.update_location(from, to)
    end

    def update_availability id, is_available # updatecab availibility
      cab = get_cab(id)
      cab.update_availablility is_available
    end

    def get_all_cabs  # return all cabs
      return @@cabs
    end

    def get_cab id  # return current cab
      if (@@cabs[id].nil?)
        raise "Cab not exist"
      end
      return @@cabs[id]
    end

    def get_available_cab from
      result = []
      @@cabs.values.each do |c|
        if c.is_available and c.location.srt_distance(from) <= MAX_ALLOWED_TRIP_MATCHING_DISTANCE
          result << c
        end
      end
      result
    end

    def closed_by_cab available_cabs # return first cab available to user
      if available_cabs.count == 0
        return nil
      end
      return available_cabs.first
    end

    def book rider, source_x, source_y, dest_x, dest_y
      from, to = Location.new(source_x, source_y), Location.new(dest_x, dest_y)
      close_by_cabs = get_available_cab(from) # get all available cabs
      close_available_cabs = close_by_cabs.select {|c| c.current_trip == nil} # get all current available cabs
      selected_cab = closed_by_cab(close_available_cabs)
      if selected_cab.nil?
        raise "No Cab Available"
      end
      price = from.find_price(to)
      new_trip = Trip.new(selected_cab, rider, price, from, to) # create new trip
      selected_cab.current_trip, selected_cab.is_available = new_trip, false
      register_trip = TripUtility.new.register(new_trip) # insert into in memeory db
      return true
    end

    def end_trip cab_id
      cab = get_cab(cab_id)
      cab.is_available = true
      cab.current_trip.end_trip
      cab.current_trip = nil
      return "Trip Ended"
    end

    def get_cab id  # return current cab
      if (@@cabs[id].nil?)
        raise "Cab not exist"
      end
      return @@cabs[id]
    end
  end
end