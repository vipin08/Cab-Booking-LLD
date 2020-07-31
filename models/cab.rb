module ActiveUtility
  class Cab
    attr_accessor :is_available, :location, :current_trip

    def initialize id, name, is_available=true
      @id = id
      @name = name
      @is_available = true
      @location = Location.new
      @current_trip = nil
    end

    def update_location from, to
      @location.update(from, to)
    end

    def update_availablility is_available
      @is_available = is_available
    end
  end
end