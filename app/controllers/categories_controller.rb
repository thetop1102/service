class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action(only: :show) {find_object "category", "id"}

  def show
    @tours = @category.tours.all
  end
end
