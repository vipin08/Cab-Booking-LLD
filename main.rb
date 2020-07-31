require './models/cab'
require './models/rider'
require './models/trip'
require './models/location'
require './utility/trip_utility'
require './utility/cab_utility'
require './utility/rider_utility'

include ActiveUtility
include Utility

cab_utility = CabUtility.new
rider_uility = RiderUtility.new
trip_uility = TripUtility.new

r1 = "r1"
rider_uility.register(r1, "ud");
r2 = "r2";
rider_uility.register(r2, "du");
r3 = "r3";
rider_uility.register(r3, "rider3");
r4 = "r4";
rider_uility.register(r4, "rider4");

r7 = "r7";

c1 = "c1";
cab_utility.register(c1, "driver1");
c2 = "c2";
cab_utility.register(c2, "driver2");
c3 = "c3";
cab_utility.register(c3, "driver3");
c4 = "c4";
cab_utility.register(c4, "driver4");
c5 = "c5";
cab_utility.register(c5, "driver5");


cab_utility.update_location(c1, 1.0, 1.0);
cab_utility.update_location(c2, 2.0, 2.0);
cab_utility.update_location(c3, 100.0, 100.0);
cab_utility.update_location(c4, 110.0, 110.0);
cab_utility.update_location(c5, 4.0, 4.0);

cab_utility.update_availability(c2, false);
cab_utility.update_availability(c4, false);

p rider_uility.book(r1, 0.0, 0.0, 500.0, 500.0);
p rider_uility.book(r2, 0.0, 0.0, 500.0, 500.0);

p rider_uility.history(r2)

p cab_utility.end_trip(c1)

p rider_uility.history(r1)

p cab_utility.update_availability(c1, false);

p rider_uility.history(r7)


