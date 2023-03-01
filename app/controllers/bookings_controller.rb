class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.status = "Pending"
    @lesson = Lesson.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    @booking.save
    authorize @booking #need to check that
    redirect_to dashboard_path
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    authorize @booking #need to check that
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    @booking.save
    authorize @booking #need to check that
    redirect_to dashboard_path

  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.status = "Cancelled"
    @booking.save
    authorize @booking #need to check that
    redirect_to dashboard_path

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

  # def available?
  #   Dates_taken = Lesson.find_by_id(params[:id]).bookings.map{|booking| booking.date}
  #   unless Dates_taken.include?(@booking.date)
  #   end
  # end

end
