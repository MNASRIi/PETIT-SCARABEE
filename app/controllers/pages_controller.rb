class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
  end

  def dashboard
    @user = current_user
    mybookings
    mylessons
  end

  def mybookings
    @student_bookings = current_user.bookings
    @teacher_bookings = current_user.requested_bookings
  end

  def mylessons
    @mylessons = current_user.lessons
  end
end
