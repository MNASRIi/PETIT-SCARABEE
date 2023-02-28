class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
  end

  def dashboard
  end

  def mybookings
    @student_bookings = Booking.where(user == current_user)
    @teacher_bookings = Booking.where(lesson.user == current_user)
  end

  def mylessons
    @lessons = Lesson.where(user == current_user)
  end
end
