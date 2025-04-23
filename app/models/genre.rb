class Genre < ApplicationRecord
  has_many :games

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 20 }
  
  scope :search_by_genre, ->(query, match_type) {
    case match_type
    when 'partial' then where('name LIKE ?', "%#{query}%")
    else all
    end
  }
  
end