require 'test_helper'

class TourBookingsControllerTest < ActionController::TestCase
  setup do
    @tour_booking = tour_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_booking" do
    assert_difference('TourBooking.count') do
      post :create, tour_booking: { bookingname: @tour_booking.bookingname, cost: @tour_booking.cost, date: @tour_booking.date, description: @tour_booking.description, time: @tour_booking.time, tourname: @tour_booking.tourname }
    end

    assert_redirected_to tour_booking_path(assigns(:tour_booking))
  end

  test "should show tour_booking" do
    get :show, id: @tour_booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_booking
    assert_response :success
  end

  test "should update tour_booking" do
    patch :update, id: @tour_booking, tour_booking: { bookingname: @tour_booking.bookingname, cost: @tour_booking.cost, date: @tour_booking.date, description: @tour_booking.description, time: @tour_booking.time, tourname: @tour_booking.tourname }
    assert_redirected_to tour_booking_path(assigns(:tour_booking))
  end

  test "should destroy tour_booking" do
    assert_difference('TourBooking.count', -1) do
      delete :destroy, id: @tour_booking
    end

    assert_redirected_to tour_bookings_path
  end
end
