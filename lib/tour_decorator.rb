# the concret component we would like to decorate, a car in our example
class BasicTourBooking
	def initialize(cost, tourname, bookingname, date, time)
		@cost = cost
		@tourname = tourname
		@bookingname = bookingname
		@date = date
		@time = "18:00"
	end
	
	# getter method
	def cost
		return @cost
	end
	
	def details
		return @tourname + ": #{@cost} - " + @bookingname + " - " + @date  + " - " + @time
	end	
end

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class TourBookingDecorator
	def initialize(real_tour_booking)
		@real_tour_booking = real_tour_booking
		@extra_cost = 0
		@description = "No extrs Added"
	end
	
	def cost
		return @extra_cost + @real_tour_booking.cost
	end
	
	def details
		return @description + " " + @real_car.details
	end
	
end


# a concrete decorator
class MealDecorator < TourBookingDecorator
	def initialize(real_tour_booking)
		super(real_tour_booking)
		@description = "3 Course Meal Added"
		@extra_cost = 20
	end
	
	def details
		return @description + ": #{@extra_cost} + " + @real_tour_booking.details  
	end	
end

# another concrete decorator
class HostelDecorator < TourBookingDecorator
	def initialize(real_tour_booking)
		super(real_tour_booking)
		@description = "One night stay at hostel"
		@extra_cost = 50
	end
	
	def details
		return @description + ": #{@extra_cost} + " + @real_tour_booking.details  
	end	
end

# another concrete decorator
class BreweryDecorator < TourBookingDecorator
	def initialize(real_tour_booking)
		super(real_tour_booking)
		@description = "Entry to Guiness Brewery"
		@extra_cost = 5
	end
	
	def details
		return @description + ": #{@extra_cost} + " + @real_tour_booking.details  
	end	
end
