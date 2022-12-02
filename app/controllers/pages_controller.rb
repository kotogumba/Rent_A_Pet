class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @pets = current_user.pets
    @bookings = current_user.bookings
    @bookmarks = current_user.bookmarks
  end
end
