class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :review_image

  validates :title, presence: true
  validates :body, presence: true
  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :star, presence: true
  
  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

end