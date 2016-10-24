class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :discount

  has_one :payment
  has_many :activities, as: :activable, dependent: :destroy

  enum status: [:init, :pending, :accepted, :ignored, :canceled]

  before_create :apply_discount, unless: :discount

  validate :start_date_validate, on: :create

  private
  def apply_discount
    unless discount && total_price
      if tour.discount && tour.discount.active?
        discount = tour.discount
        total_price = tour.price - tour.price * discount
        discount_id = discount.id
      else
        total_price = tour.price
      end
    end
  end

  def start_date_validate
    if start_date < Date.current
      errors.add :start_date, I18n.t("model_validate.start_date")
    end
  end
end
