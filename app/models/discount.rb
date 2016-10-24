class Discount < ApplicationRecord
  has_many :bookings, through: :tours
  has_many :tours, dependent: :destroy

  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :percent, presence: true
  validate :start_date_validate, on: :create
  validate :end_date_validate, on: :create

  enum status: [:oncoming, :happening, :finished]

  private
  def start_date_validate
    if start_date < Date.current
      errors.add :start_date, I18n.t("model_validate.start_date")
    end
  end

  def end_date_validate
    if end_date < start_date
      errors.add :end_date, I18n.t("model_validate.end_date_start")
    end
  end
end
