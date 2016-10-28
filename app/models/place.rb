class Place < ApplicationRecord
  has_many :tours, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
