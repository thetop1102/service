class Tour < ApplicationRecord
  belongs_to :discount
  belongs_to :place
  belongs_to :category

  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  scope :filter_title, -> search_title{
    where("tours.name LIKE '%#{search_title}%'")}

  ratyrate_rateable "quality"

  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
end
