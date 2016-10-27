class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :sub_comments, class_name: "Comment", foreign_key: "parent_id",
    dependent: :destroy
  belongs_to :parent_comment, class_name: "Comment"

  has_many :activities, as: :activable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
