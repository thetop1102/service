class ToursController < ApplicationController
  skip_before_action :authenticate_user!
  before_action(only: :show) {find_object "tour", "id"}

  def index
    @tours = tours_search
  end

  def show
    @booking = @tour.bookings.build 
  end

  private
  def tours_search
    Tour.filter_title params[:search_title]
  end
end
