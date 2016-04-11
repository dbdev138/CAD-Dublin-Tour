require 'my_logger'
require 'tour_decorator'

class TourBookingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:edit, :destroy]
  before_action :set_tour_booking, only: [:show, :edit, :update, :destroy]
  
  def ensure_admin
    unless current_user && current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized
    end
  end

  # GET /tour_bookings
  # GET /tour_bookings.json
  def index
    @tour_bookings = TourBooking.all
    if params[:search]
      @tour_bookings = TourBooking.search(params[:search]).order("created_at DESC")
    else
      @tour_bookings = TourBooking.all.order("created_at DESC")
    end
  end

  # GET /tour_bookings/1
  # GET /tour_bookings/1.json
  def show
  end

  # GET /tour_bookings/new
  def new
    @tour_booking = TourBooking.new
  end

  # GET /tour_bookings/1/edit
  def edit
  end

  # POST /tour_bookings
  # POST /tour_bookings.json
  def create
    #tour_booking_params
    @tour_booking = TourBooking.new()
    
    @tour_booking.tourname = params[:tour_booking][:tourname]
    @tour_booking.bookingname = params[:tour_booking][:bookingname]
    @tour_booking.date = params[:tour_booking][:date]
    @tour_booking.time = params[:tour_booking][:time]
    
    newTourBooking = BasicTourBooking.new(30, @tour_booking.tourname, @tour_booking.bookingname, @tour_booking.date, @tour_booking.time)
    
    if params[:tour_booking][:meal].to_s.length > 0
      then newTourBooking = MealDecorator.new(newTourBooking)
    end
    
    if params[:tour_booking][:hostel].to_s.length > 0
      then newTourBooking = HostelDecorator.new(newTourBooking)
    end
    
    if params[:tour_booking][:brewery].to_s.length > 0
      then newTourBooking = BreweryDecorator.new(newTourBooking)
    end 
    
    @tour_booking.cost = newTourBooking.cost
    @tour_booking.description = newTourBooking.details
    
    logger = MyLogger.instance
    logger.logInformation("A new booking has been made: " + @tour_booking.description)

    respond_to do |format|
      if @tour_booking.save
        format.html { redirect_to @tour_booking, notice: 'Tour booking was successfully created.' }
        format.json { render :show, status: :created, location: @tour_booking }
      else
        format.html { render :new }
        format.json { render json: @tour_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_bookings/1
  # PATCH/PUT /tour_bookings/1.json
  def update
    
    @tour_booking.tourname = params[:tour_booking][:tourname]
    @tour_booking.bookingname = params[:tour_booking][:bookingname]
    @tour_booking.date = params[:tour_booking][:date]
    @tour_booking.time = params[:tour_booking][:time]
    
    newTourBooking = BasicTourBooking.new(30, @tour_booking.tourname, @tour_booking.bookingname, @tour_booking.date, @tour_booking.time)
    
    if params[:tour_booking][:meal].to_s.length > 0
      then newTourBooking = MealDecorator.new(newTourBooking)
    end
    
    if params[:tour_booking][:hostel].to_s.length > 0
      then newTourBooking = HostelDecorator.new(newTourBooking)
    end
    
    if params[:tour_booking][:brewery].to_s.length > 0
      then newTourBooking = BreweryDecorator.new(newTourBooking)
    end
    
    @tour_booking.cost = newTourBooking.cost
    @tour_booking.description = newTourBooking.details
    
    updated_information = {
      "tourname" => @tour_booking.tourname,
      "bookingname" => @tour_booking.bookingname,
      "date" => @tour_booking.date,
      "cost" => @tour_booking.cost,
      "description" => @tour_booking.description,
      "time" => @tour_booking.time
    }
    
    respond_to do |format|
      if @tour_booking.update(tour_booking_params)
        format.html { redirect_to @tour_booking, notice: 'Tour booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_booking }
      else
        format.html { render :edit }
        format.json { render json: @tour_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_bookings/1
  # DELETE /tour_bookings/1.json
  def destroy
    @tour_booking.destroy
    respond_to do |format|
      format.html { redirect_to tour_bookings_url, notice: 'Tour booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_booking
      @tour_booking = TourBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_booking_params
      params.require(:tour_booking).permit(:cost, :tourname, :bookingname, :date, :time, :description)
    end
end
