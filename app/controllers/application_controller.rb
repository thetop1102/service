class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for user
    current_user.is_admin? ? admin_dashboard_path : root_path
  end

  def access_denied exception
    redirect_to root_path, alert: exception.message
  end
end
