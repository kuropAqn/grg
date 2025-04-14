class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :user_id, presence: true
  validates :review_id, presence: true

  validates :user_id, uniqueness: { scope: :review_id, message: "has already favorited this review" }
  validates :review_id, uniqueness: { scope: :user_id, message: "has already been favorited by this user" }

end