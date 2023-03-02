class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home
  end

  def dashboard
    @user = current_user
    mybookings
    mylessons
    popup
  end

  def mybookings
    @student_bookings = current_user.bookings
  end

  def mylessons
    @mylessons = current_user.lessons
    @bookings = current_user.requested_bookings
  end

  def popup
      @users = User.all
      @card = @users.map { |user| { profile_card_html: render_to_string(partial: "shared/profile_popup", locals: {user: flat}) } }
  end

end
