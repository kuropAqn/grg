class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :favorites

  has_one_attached :review_image

  validates :title, presence: true
  validates :body, presence: true
  validates :review_image, presence: true
  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :star, presence: true
  
end