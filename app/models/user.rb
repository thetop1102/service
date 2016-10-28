class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable,
    :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :bank_accounts, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy

  class << self
    def from_omniauth access_token
      data = access_token.info
      user = User.find_by email: data["email"]

      unless user
        password = Devise.friendly_token[0,20]
        user = User.create name: data["name"], email: data["email"],
          password: password, password_confirmation: password
      end
      user
    end
  end

  def liked? target_object
    likes.where(likeable_type: target_object.class,
      likeable_id: target_object.id).exists?
  end
  ratyrate_rater
end
