class BookingsController < ApplicationController

  def create
  @booking = Booking.new(params[:booking])
  @lesson = Lesson.find(params[:lesson_id])
  @booking.lesson = @lesson
  @booking.user = current_user
  end

  def update

  end

  def destroy

  end

end
