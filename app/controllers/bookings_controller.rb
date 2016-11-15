class BookingsController < ApplicationController
  before_action(only: :create) {find_object "tour", "tour_id"}
  before_action(except: :create) {find_object "tour_booking"}

  def create
    @booking = @tour.bookings.new booking_params
    @booking.user = current_user
    if @booking.save
      flash.now[:success] = t "booking.created"
      redirect_to [@tour, @booking]
    else
      flash[:danger] = t "booking.created_error"
      flash[:danger] = @booking.errors.full_messages[0]
      redirect_to :back
    end
  end

  def show
  end

  def update
    authorize @booking
    if params[:user_payment]
      payment = @booking.create_payment amount: @booking.total_price
      if payment.update_attributes status: "completed", 
        transaction_id: paypal_params[:txn_id], purchased_at: Time.now
        @booking.pending!
      end
    end
    flash.now[:success] = "Booking are pending to Admin"
    redirect_to [@tour, @booking]
  end

  private
  def booking_params
    params.require(:booking).permit :start_date, :tour_id
  end

  def paypal_params
    params.permit :payment_status, :invoice, :txn_id
  end
end
