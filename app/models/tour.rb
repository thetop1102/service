class Tour < ApplicationRecord
  belongs_to :discount
  belongs_to :place
  belongs_to :category

  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :filter_title, -> search_title{
    where("tours.name LIKE '%#{search_title}%'")}
end
