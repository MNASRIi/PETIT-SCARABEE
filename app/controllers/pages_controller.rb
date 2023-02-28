class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
  end

  def dashboard
    mybookings
    mylessons
    new_lesson
  end

  def mybookings
    @student_bookings = Booking.where(user: current_user)
    @teacher_bookings = []
    @lessons = Lesson.where(user_id: current_user.id)
    @lessons.each { |lesson| @teacher_bookings << Booking.find_by_lesson_id(lesson.id) }
    @teacher_bookings.compact!
  end

  def mylessons
    @mylessons = Lesson.where(user: current_user)
  end

  def new_lesson
    @lesson = Lesson.create
    @lesson.user = current_user
  end
end
