class Genre < ApplicationRecord
  has_many :games

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 20 }
  
end