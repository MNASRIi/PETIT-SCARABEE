class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    authorize @booking
    @booking.status = "Pending"
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "Accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "Declined"
    @booking.save
    redirect_to dashboard_path

  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "Cancelled"
    @booking.save
    redirect_to dashboard_path

  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
  end

private
  def bookings_params
    params.require(:booking).permit(:date)
  end

  # def available?
  #   Dates_taken = Lesson.find_by_id(params[:id]).bookings.map{|booking| booking.date}
  #   unless Dates_taken.include?(@booking.date)
  #   end
  # end

end
