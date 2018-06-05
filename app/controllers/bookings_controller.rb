class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      flash.now[:notice] = @booking.errors.messages
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:restaurant, :start_time, :end_time)
  end
end
