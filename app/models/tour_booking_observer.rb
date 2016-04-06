require 'my_logger'

class TourBookingObserver < ActiveRecord::Observer
   
    def after_update(record)
        # use the MyLogger instance method to retrieve the single instance/object
        @logger = MyLogger.instance
        # use the logger to log/record a message about the updated car_params
        @logger.logInformation("############################# Observer:")
        @logger.logInformation("+++ TourBookingObserver: The Booking for " +
        "#{record.bookingname}: #{record.tourname} has been updated." +
        "Cost #{record.cost}")
        @logger.logInformation("#############################################")
    end
    
    def after_create(record)
        # use the MyLogger instance method to retrieve the single instance/object
        @logger = MyLogger.instance
        # use the logger to log/record a message about the updated car_params
        @logger.logInformation("#############################################")
        @logger.logInformation("+++ TourBookingObserver: The Booking for " +
        "#{record.bookingname}: #{record.tourname} has been Created." +
        "Cost #{record.cost}")
        @logger.logInformation("#############################################")
    end
    
end