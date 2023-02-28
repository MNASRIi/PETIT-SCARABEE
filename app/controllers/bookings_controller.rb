class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    authorize @booking
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    authorize @booking
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    @booking.save
    authorize @booking
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.status = "Canceled"
    @booking.save
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
  end

private
  def bookings_params
    params.require(:booking).permit(:date)
  end

end
