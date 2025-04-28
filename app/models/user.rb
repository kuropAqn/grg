class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable


  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  scope :search_by_name, ->(query, match_type) {
    case match_type
    when 'partial' then where("CONCAT(name) LIKE ?", "%#{query}%")
    else all
    end
  }

  def active_for_authentication?
    super && (is_active == true)
  end

  def already_favorited?(game)
    self.favorites.exists?(game_id: game.id)
  end

end