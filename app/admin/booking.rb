ActiveAdmin.register Booking do
  filter :created_at
  filter :user_name_cont, as: :select
  filter :place_name_cont, as: :select

  scope :init
  scope :pending, default: true
  scope :accepted
  scope :ignored
  scope :canceled

  actions :index, :update

  index do
    selectable_column
    id_column
    column :status
    column :total_price
    column :start_date
    column :created_at
    column :updated_at
  end

  batch_action :accept_all do |ids|
    Booking.find(ids).each do |booking|
      booking.accepted!
    end
    redirect_to admin_bookings_path
  end
  
  batch_action :ignore_all do |ids|
    Booking.find(ids).each do |booking|
      booking.ignored!
    end
  end
end
