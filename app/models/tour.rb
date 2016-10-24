class Tour < ApplicationRecord
  belongs_to :discount
  belongs_to :place
  belongs_to :category

  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
end
