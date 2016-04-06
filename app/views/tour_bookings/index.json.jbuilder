json.array!(@tour_bookings) do |tour_booking|
  json.extract! tour_booking, :id, :cost, :tourname, :bookingname, :date, :time, :description
  json.url tour_booking_url(tour_booking, format: :json)
end
