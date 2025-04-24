class Game < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy

  has_one_attached :game_image

  validates :title, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true

  validates :game_image, presence: true

  scope :search_by_title, ->(query, match_type) {
    case match_type
    when 'partial' then where('title LIKE ?', "%#{query}%")
    else all
    end
  }

end