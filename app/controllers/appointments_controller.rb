class AppointmentsController < ApplicationController
  def index
    @bookings = Booking.all
  end
end
