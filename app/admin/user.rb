ActiveAdmin.register User do
  filter :name_cont
  filter :created_at
  actions :index, :show, :destroy

  index do
    id_column
    column :name
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :created_at
  end

  controller do
    rescue_from ActiveRecord::RecordNotFound, with: :show_errors

    def show_errors
      flash[:danger] = t "user_resources.not_found"
      redirect_to admin_dashboard_path
    end
  end
end
