class PagesController < ApplicationController
  def home
  end

  def mybookings
    @user = current_user
    @bookings = @user.bookings
    @authorize
  end

  def dashboard
  end

end
