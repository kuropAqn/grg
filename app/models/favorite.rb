class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :user_id, presence: true
  validates :review_id, presence: true

  validates :user_id, uniqueness: { scope: :review_id, message: "has already favorited this review" }
  validates :review_id, uniqueness: { scope: :user_id, message: "has already been favorited by this user" }

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前
end