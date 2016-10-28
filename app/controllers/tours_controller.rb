class ToursController < ApplicationController
  skip_before_action :authenticate_user!, except: :show

  before_action(only: :show) {find_object "tour", "id" }

  def index
    @tours = tours_search
  end

  def show
    @booking = @tour.bookings.build
    @comment = current_user.comments.build
    @comments = @tour.comments
  end

  private
  def tours_search
    Tour.filter_title params[:search_title]
  end
end
