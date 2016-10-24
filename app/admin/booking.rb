ActiveAdmin.register Booking do
  includes :tour, :user

  filter :created_at
  filter :user, as: :select
  filter :place

  scope :init
  scope :pending, default: true
  scope :accepted
  scope :ignored
  scope :canceled

  actions :index, :update

  index do
    selectable_column
    id_column
    column :user do |booking|
      booking.user.name
    end
    column :place do |booking|
      booking.tour.place
    end
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
