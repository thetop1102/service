class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :access_denied
  before_action :authenticate_user!
  before_action :load_notifications

  private
  def after_sign_in_path_for user
    current_user.is_admin? ? admin_dashboard_path : root_path
  end

  def access_denied exception
    redirect_to root_path, alert: exception.message
  end

  def load_places
    @places_select = Place.all.collect {|place| [place.name, place.id]}
  end

  def load_notifications
    if current_user && !current_user.is_admin?
      @activities = Activity.order(created_at: :desc).
        my_activity current_user.id
      @count_activities = @activities.not_seen.size
    end
  end

  def find_object *args
    if args[0] == "tour_booking"
      @tour = Tour.find_by id: params[:tour_id]
      redirect_to :back unless @tour
      @booking = @tour.bookings.find_by id: params[:id]
      redirect_to :back unless @booking
    elsif args[0] == "activity"
      @notification = Activity.find_by id: params[:notification_id]
    else
      var_name = "@#{args[0]}"
      instance_variable_set(var_name,
        args[0].capitalize.constantize.find_by(id: params[args[1].to_sym]))
      unless instance_variable_get var_name
        redirect_to root_path
      end
      instance_variable_get var_name
    end
  end

  def admin_user?
    current_user.is_admin?
  end
end
