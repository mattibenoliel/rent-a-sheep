class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user_sheeps = current_user.sheeps
    @user_bookings = current_user.bookings

  end
end
