class TourBooking < ActiveRecord::Base
    
    def self.search(search)
       where("bookingname LIKE ?", "%#{search}") 
    end
    
end
