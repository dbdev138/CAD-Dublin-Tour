class TourBookingMailer < ApplicationMailer
    
    def booking_confirmation(tour_booking)
        #Make tour_booking attributes available in the view 
        @tour_booking = tour_booking
        #Set the mail attributes
        mail(:to => tour_booking.bookingname, :subject => "Tour Booked!!!", :from => "cadproject2016@gmail.com")
    end
    
end
